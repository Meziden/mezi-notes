# 信号与系统

### 第六章 信号与系统的时域与频域特征

**1. Magnitude and Phase Response/ 幅度与相位响应**

对于一个由LTI系统将$X(j\omega)$变换为$Y(j\omega)$的过程可以表示为：
$$
Y(j\omega) = H(j\omega) X(j\omega)
$$

使用相量表示如下 :
$$
\bold{Y} = \bold{H} \bold X
$$

则其幅度响应如下 :
$$
|Y(j\omega)| = |H(j\omega)||X(j\omega)|
$$
相位响应如下 :
$$
\angle Y(j\omega) = \angle H(j\omega) + \angle X(j\omega)
$$

  

**2. Linear and Non-linear Phase Response / 线性与非线性相位响应**

对于线性的相位响应，例如$H(j\omega) = e^{-j\omega t_0}$，即$\angle H(j\omega) = -\omega t_0$，其位于角速度$\omega$上的时域延迟就可以表示为 :
$$
\Delta t(\omega) = {\angle H(j\omega) \over \omega} = -t_0
$$
即对于所有频率的信号分量来说，其时域上的延迟就是一个固定值。

当其相位响应不满足线性时，其对各个频率的影响就需引入*群延迟 Group Delay* 来描述。

  

**3. Group Delay / 群延迟**

群延迟的定义如下 :
$$
\tau(\omega) = - {d \over d\omega} \angle H(j\omega),
$$
对于单一频率输入，群延迟不会对其造成影响。

对于由一系列频率接近的分量构成的信号，如经AM调制，其信息包含在其包络线上的信号(可在第8章/信号调制解调中找到相关信息)，信号的包络线实质上是由其分量中峰值/谷值集中分布造成的。

为帮助理解举一个栗子：

设有两个信号：
$$
x_1(t) = cos(2.00\pi t), x_2(t) = cos((2.00+0.25)\pi t)， \Delta \omega = 0.25\pi
$$
其和信号如下图绿色函数图像所示：

将$x_2(t)$更换为$x_2(t+0.2)$，绘出黄色函数图像，其相位移动了$\Delta \theta = \Delta t \times \omega = 0.45\pi$。

从图像上看，其峰/谷值及其包络线的时域位移约为$\Delta t_{group} = -1.8s$。

![cha6svg1](./res/cha6svg1.svg)

从理论分析，在两个分量的角速度相差$\Delta \omega$时，包络线的时间轴位移可以表示如下：
$$
\Delta t_{group} = -{\Delta \theta \over \Delta \omega} = -{0.45\pi \over 0.25\pi} = -1.8s
$$
将这个结果推广到一系列频率接近的信号分量上($\Delta\omega, \Delta \theta \to 0$)，可以得到：
$$
\tau_{group} (\omega)= - {d\theta \over d\omega}
$$
该式即与式(6)相同，为群延迟的表达式。

在使用$\angle H(j\omega)$时，有时需使用未被卷绕的相位，以免在群延迟上得到不连续的点。

群延迟对于一个经由不同频率AM调制的信号可能存在相当大的影响。比如分别经由$\omega_1$与$\omega_2$的调制的AM信号，若一个系统对于这两个频率的群延迟满足一定条件，其包含信息的包络线可能发生重叠，甚至是位置交换。

  

**4. Constant Coefficient Differential Equations / 连续时间 线性常系数微分方程**

**依赖关系提示：**本节内容的扩展可在与第九章/拉普拉斯变换找到。

一阶及二阶连续时间系统可以被转换为线性常系数微分方程，并进一步转换为傅里叶变换所构成的等式进行求解。

如式(10)就描述了了一个一阶系统：
$$
\tau {dy(t) \over dt} + y(t) = x(t)
$$

$$
j\omega \tau Y(j \omega) + Y(j\omega)= X(j\omega)
$$

其中，$\tau$是表述一阶系统脉冲/阶跃响应$t\to0^+$时的变化速率。(具体应用见4a)

使用第一节所示关系，可以将其转换为:
$$
H(j\omega) = {Y(j\omega) \over X(j\omega)} = {1 \over 1+j\omega\tau}
$$
在求解该式的幅度与相位响应时，使用相量运算法则分别计算分子分母后合并可减少运算量，如：
$$
\begin{split}
H(j\omega) \to \bold{H} &= {1 \angle 0^{\circ} \over \sqrt{1+(\omega \tau)^2}\angle \arctan(\omega \tau/1)}\\
& = {1\over \sqrt{1-(\omega \tau)^2}} \angle -\arctan(\omega \tau / 1)
 \end{split}
$$

对于一个二阶系统，其微分方程具有以下形式：
$$
{d^2y(t) \over dt^2} + 2\zeta \omega_n{dy(t) \over dt } + \omega_n^2y(t) = \omega_n^2x(t)
$$
其中，$\omega_n$是该系统脉冲响应的自然振荡角速度(natural frequency)，$\zeta$(zeta)是系统的阻尼系数(damping ratio)。(具体应用见4a)

该式可以转换为：
$$
s^2Y(j\omega) + 2\zeta \omega_nsY(j\omega) + \omega_n^2Y(j\omega) = \omega_n^2X(j\omega)
$$
该系统的脉冲响应$H(j\omega)$即表示如下：
$$
H(j\omega) = {Y(j\omega) \over X(j\omega)} = {\omega_n^2 \over (j\omega)^2 + 2\zeta \omega_n(j\omega)+\omega_n^2}
$$

  

**4a. Application of C.C.D.E. / 线性常系数差分方程内参数的确定与应用**

设有下图所示的RC一阶低通滤波器 :

![cha6p1](./res/cha6p1.png)

冷静分析后，得到其各变量间的微分方程：
$$
v_R(t) + v_C(t) = C{dv_{out}(t) \over dt} \times R + v_{out}(t) = v_{in}(t)
$$
魔改式(16)的部分使其匹配式(10)所示形式，可以发现$\tau = RC$。

![cha6p1](./res/cha6p2.png)

该系统的阶跃响应如图所示，$y(t) =K(1 - e^{-t/ \tau})$。

对于不同的一阶系统，其$\tau$的表达式都各不相同，但$\tau$具有相同值的系统，其单位脉冲/阶跃响应的形式是完全相同的。

同样，对于一个二阶系统，例如RLC二阶滤波器，其脉冲响应如下图所示。

如图所示，当$\zeta>1$时，即过阻尼(overdamped)，其脉冲响应中不存在负的部分; 而当$\zeta < 1$时，为欠阻尼状态(underdamped)，其脉冲响应有振荡现象。

![cha6p1](./res/cha6p3.png)

仿照该节例子中一阶系统得到关于输入输出的微分方程，将其对应到式(13)中的形式，得到描述该系统的两个参数：
$$
\omega_n = {1 \over \sqrt{LC}}, \zeta = {R \over 2} \sqrt{C \over L}
$$
使用这两个参数即可描述一个二阶系统单位脉冲响应的全部特征。

**依赖关系提示：**关于一次/二次系统的离散情况分析，请参考该仓库于 DSP/离散时间信号处理 下的相关资料。