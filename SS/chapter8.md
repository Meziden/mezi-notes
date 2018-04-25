# 信号与系统

### 第八章 信号调制/解调

**0. Basic Law / 基本法**

- 时域相乘对应频域卷积。
- 时域卷积对应频域相乘。


  

**1a. Amplitude Modulation (AM) / 振幅调制**

现有源信号$m(t)$与高频载波信号$c(t)$

载波信号：
$$
c(t)=cos(\omega_c t)
$$
在频域上为两个关于纵轴对称的脉冲：
$$
C(\omega) = {1\over 2} \delta(\omega-\omega_c) + {1\over 2} \delta(\omega-\omega_c)
$$
设输出信号：

$$
y(t) = m(t) \times c(t)
$$

则根据基本法，其输出信号的频域：
$$
Y(\omega) = C(\omega)*M(\omega)
$$
各信号的频域如图所示：

![cha8p1](res/cha8p1.png)

  

**1b. AM Signal Demodulation / AM信号解调**

在时域上相乘可以实现频域上卷积，所以可以再次使用频域上卷积使得源信号恢复到原点，再配合滤波器实现信号还原。

下图所示电路即用于AM解调的 *Envelope Detector / 包络检波电路*  

![cha8p1a](res/cha8p1a.png)

其中，电容与电阻连结(输出)可被视为低通滤波器，$\omega_0 = 1/RC$ 需置于载波与源信号频率之间。

其效应如下图所示 :

![cha8p1b](res/cha8p1b.png)

杂项：

- 在二极管包络检波电路中，如载波频率较高时，二极管应选用GaAs(高载流子迁移速率)材料，以免二极管状态切换速度过慢。
- 在AM调制过程中，通常需限制调制后信号的最低幅值，否则在使用包络检波解调时易产生较大噪声。

  

**2a. Frequency Modulation (FM) / 频率调制**

与AM改变幅度相比，FM具有不同的操作，即改变载波频率传输信号：

![cha8p1](res/cha8p2.gif)

输出信号可使用如下表达式表述：

(如下表述由维基百科*Frequency Modulation*条目经社会主义改造优化而来)
$$
y(t) = A_c \times cos( \int_0^t \omega(\tau)d\tau )
$$
其中$A_c$为载波幅度，$\omega(\tau)$为瞬时角速度。设初始相位为0，$\int^t_0 \omega(\tau) d\tau$即为当前相位。 

瞬时角速度可以被进一步分解为:
$$
\omega (t) = \omega_c + \omega_\Delta m(t)
$$
其中$\omega_c$为载波角速度，$\omega_\Delta$为最大频率偏移。设$m(t)$幅度介于(-1,1)。

则该式可进一步化为：
$$
y(t) = A_c \times cos( \int_0^t (\omega_c + \omega_\Delta m(\tau)\ )d\tau )
$$

$$
y(t) = A_c \times cos(\omega_ct + \int_0^t \omega_\Delta m(\tau)d\tau )
$$

  

**2b. FM Signal Demodulation / FM信号解调**

根据上述FM调制的表达式，FM解调的模型如下所示:

在包络检波前置一个微分器构成鉴频器(Frequency Detector)，即可将频域变化转化为电压变化。

![cha8p2b](res/cha8p2b.png)

后置滤波器可以减小因包络检波产生的高频噪声。

  

**3. Comparing AM & FM / 两种信号调制比较**

- AM

  调制/解调设备简单。

- FM

  信噪比(SNR)高于AM，但调制解调设备较为复杂。