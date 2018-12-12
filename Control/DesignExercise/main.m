%
% Dynamo, Buck-Converter, Super-Capacitor System Simulation
% Powered by State-Space Average Model
%
% Matlab-Octave Compatibility Enchanced 
% Revision 5.0
%

function main()
	%% DEBUG PARAMETER
	TIMESCALE = 100;	
	
	%% Setting up circuit parameter
	C_super = 70;			% Super Capacitor - Capacitance
	C_buck = 2;				% Buck Capacitor - Capacitance
	L_buck = 0.5;			% Buck Inductor - Inductance
	R_in = 0.03;			% Internal Resistor - Resistance
	R_load = 5;				% Load Resistor - Resistance
	
	%% Feedback Controller, exceeded energy storage.
	K_sl = 10;
	
	%% Setting up motor parameter
	J_motor = 10;			% Dynamo - Moment of Inertia
	K_m = 0.5;				% Dynamo - Torque/Current Coefficient
	K_e = 0.4;				% Dynamo - Voltage/Speed Coefficient
	
	%% Setting up environment parameter
	F_air = 0.1;			% Air and mechanical Friction
	D_pwm = 1;			% PWM Duty-Cycle
	
	%% State-Space Average Model mosTRI (SSA/TRI)
	mat_A = [	-(K_m*K_e)/(J_motor*R_in)-(F_air/J_motor) K_m/(J_motor*R_in) -(K_sl/J_motor) 0;
				K_e/(C_super*R_in) -1/(C_super*R_in) 0 -(1/C_super);
				0 0 -(1/C_buck*R_load) (1/C_buck);
				0 (1/L_buck) -(1/L_buck) 0];
	
	mat_B = [	(1/J_motor) (K_sl/J_motor);
			 	0 0;
			 	0 0;
			 	0 0];
	
	mat_C = [0 0 1 0];		%% Observer Matrix for Load Voltage
	
	mat_C1 = [K_e 0 0 0];	%% Observer Matrix for Potential
	
	mat_D = [0];			%% SISO System
	
	%% State-Space Average Model mosCUT (SSA/CUT)
	mat_Ap = [	-(K_m*K_e)/(J_motor*R_in)-(F_air/J_motor) K_m/(J_motor*R_in) -(K_sl/J_motor) 0;
				K_e/(C_super*R_in) -1/(C_super*R_in) 0 0;
				0 0 -(1/C_buck*R_load) (1/C_buck);
				0 0 -(1/L_buck) 0];
	
	%% Summarize The System (SSA/FINAL)
	mat_A = D_pwm * mat_A + (1-D_pwm) * mat_Ap;
	
	%% State-Space Average Model Total (SSA/FINAL)
	SYS_G = ss(mat_A, mat_B, mat_C, mat_D);
	SYS_E = ss(mat_A, mat_B, mat_C1, mat_D);
	
	%% Simulation
	vec_wind = csvread('./data.csv')';
	vec_wind = [vec_wind, vec_wind, vec_wind, vec_wind];
	
	vec_t = linspace(0,TIMESCALE,length(vec_wind));
	
	vec_ctrl = [zeros(1, length(vec_wind)/2).+200 ...
				zeros(1, length(vec_wind)/4).+270 ...
				zeros(1, length(vec_wind)/4).+200];
	
	vec_u = [vec_wind' vec_ctrl'];
	vec_y = lsim(SYS_G, vec_u, vec_t);
	vec_E = lsim(SYS_E, vec_u, vec_t);
	
	%% Result Demonstration
	plot(vec_t, vec_y, 'Linewidth', 2);
	hold on;
	plot(vec_t, vec_wind, 'LineWidth',2);
	plot(vec_t, vec_E, 'LineWidth',2);
	plot(vec_t, vec_ctrl, 'LineWidth',2);
	title('SSAM System Simulation Result');
	xlabel('Time/s');
	ylabel('Torque In/ Voltage Out');
	legend('Load Voltage','Windspeed','Dynamo Voltage','Control Signal');
end
