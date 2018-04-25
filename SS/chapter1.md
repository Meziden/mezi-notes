# 信号与系统

### 第一章

**1. Energy and average power / 信号能量与平均功率**

信号能量：
$$
E_{CT} = \int_{t_1}^{t_2}|x(t)|^2dt, E_{DT} = \sum^{n_2}_{n=n_1}|x[n]|^2
$$

时间平均功率，于无限大区间：
$$
P_{CT \infty} = \lim_{T\to \infty}{1 \over 2T}\int_{-T}^T |x(t)|^2dt
$$

$$
P_{DT \infty} =\lim_{N\to \infty}{1 \over 2N+1}\sum_{-N}^N|x[n]|^2
$$

**2. Classifying Signals / 信号分类**

Finite-energy signal / 有限能量信号：
$$
E_\infty \neq \infty,P_\infty = 0
$$
Finite-average-power signal / 有限功率信号：
$$
E_\infty =  \infty,P_\infty > 0
$$

**3a. Signal tranformation / 信号变换**

现在已知$f(t)$的图像。若要求$f(2t+2)$的图像，推荐使用替换法:

1. 设$u=2t+2$, 则原图像成为$f(u)$的图像。
2. 找出图像上的关键点，使用$t={u-2 \over 2}$将其转换为t的位置，在新的$f(t)$图像中标记该点。
3. 连接全部关键点，得到正确图像。

这种方法不依赖于各种复杂的、存在不同优先级变换规律。



**4. Decomposition / 信号分解**

将源信号$x(t)$分解为奇偶两个部分：
$$
Ev\{x(t)\} = {1\over 2}[x(t) + x(-t)]
$$

$$
Od\{x(t)\} = {1\over 2}[x(t) - x(-t)]
$$

**5. Periodic Complex Exponentials / 周期信号的指数表示**

基本公式：
$$
x(t) = Ae^{j (\omega_0 t + \phi)}
$$

$$
\Re\{x(t)\} = Acos(\omega_0t+\phi)
$$

$$
\Im\{x(t)\} = Asin(\omega_0 t + \phi)
$$

扩展公式：
$$
Acos(\omega_0t+\phi) = {A \over 2} e^{j (\omega_0 t + \phi)} + {A \over 2} e^{-j (\omega_0 t + \phi)}
$$

$$
Asin(\omega_0t+\phi) = {A \over 2j} e^{j (\omega_0 t + \phi)} - {A \over 2j} e^{-j (\omega_0 t + \phi)}
$$

**6. Unit impulse and unit step function / 单位脉冲(冲激)与单位阶跃函数**

以下函数使用专有符号$\delta$(delta)与$u$。

离散/连续单位脉冲函数：
$$
\delta[n] = \begin{cases}
0, & n \neq 0\\
1, & n=0
\end{cases}
$$

$$
\delta(t) = \begin{cases}
0, & t \neq 0\\
+\infty, & t=0
\end{cases},\int_R \delta(t)dt =1
$$

离散/连续单位阶跃函数：
$$
u[n] = \begin{cases}
0, & n \lt 0\\
1, & n \geq 0
\end{cases}
$$

$$
u(t) = \begin{cases}
0, & t \lt 0\\
1, & t \geq 0
\end{cases}
$$

**7. Basic system properties / 基本系统属性**

- Memory(less) / (无)记忆系统

如果对自变量的每一个值，一个系统的输出仅仅取决于该时刻的输入，这个系统就称为无记忆系统。反之则为记忆系统。

例如 $y[n] = (2x[n]-x[n]^2)^2$ 就描述了一个无记忆系统。

  

- Intertibility / 可逆性

如果一个系统对不同输入均有不同输出，则该系统可逆。

例如 $y[n] = 2x[n]$ 就描述了一个可逆系统。 

  

- Causality / 因果性

如果一个系统某时刻的输出仅仅与此时或之前的输入相关，则该系统具有因果性。

例如 $y[n] = 2x[n] + x[n-2]$ 就描述了一个具有因果性的系统。 

  

- Stability / 稳定性

如果一个系统对于有界输入不会产生无界输出，则该系统具有稳定性。

例如 $y[n] = log_2x[n]$ 就描述了一个具有不具有稳定性的系统，因x[n]位于(0,1)时，y[n]位于$(-\infty,0)$。 

  

- Time Invariance / 时不变性

> “在时间平移变换下保持形式不变的系统.在用微分或差分方程)描述的时不变系统中，其方程式中不显含时间变量t。”

若一个系统满足$T(x[n-n_0]) = y[n-n_0]$则该系统具有时不变性。

  

- Linearity / 线性

若一个系统满足：

1. 对于$x_1(t) + x_2(t)$的输入，输出为$y_1(t)+y_2(t)$;
2. 对于$ax(t)$的输入，输出为$ay(t)$;

则该系统是一个线性系统。