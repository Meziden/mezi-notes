# 信号与系统

### 第四章 连续傅里叶变换

本章内容存在大量依赖于第三章的定义与符号。

**1. Aperiodic Signals / 非周期信号**

对于非周期信号，将其视为周期为无穷大的周期信号，则其傅里叶级数可用下式表示:
$$
a_k = {1 \over T} \int^{T/2}_{-T/2}x(t)e^{-jk \omega_0 t}dt = {1\over T}\int_R x(t)e^{-jk \omega_0 t}dt
$$
当$T \to +\infty$且$\omega_0  = {2\pi \over T}$, 可知$\omega_0 \to 0$ ，则$k\omega_0$可以描述任意频率$\omega$.

设$X(j\omega)$为幅度，则$a_k$与$X(j\omega)$存在式(2)所示关系：
$$
a_k = X(j\omega){\omega_0 \over 2\pi} = X(j\omega){1\over T}
$$
将$k \omega_0$替换为自变量$\omega$, $X(j\omega) = Ta_k$,得到连续信号的傅里叶变换：
$$
X(j\omega) = \int_R x(t)e^{-j \omega t}dt
$$
其逆向运算为：
$$
x(t) = {1 \over 2 \pi} \int_R X(j\omega) e^{j\omega t}d \omega
$$
式(3)、(4)即连续傅里叶变换对，式(4)中的$1\over 2 \pi$即是式(2)代入式(3)时产生的常量，即${dt \over d\omega} = 2 \pi$。

  

**1a. Periodic Signal /周期信号**

**依赖关系提示：**该内容依赖于 傅里叶变换特性第7条/卷积特性

对于周期信号，直接计算不易直接求得其傅里叶变换，因其变换中包含Dirac-Delta函数$\delta(\omega-\omega_0)$。

把源信号转换为一个非周期信号与一系列脉冲的卷积和，该周期信号可被分解为：
$$
x(t) = x_{ap}(t)*x_0(t)
$$
$x_0(t)$为具有该信号周期的一系列脉冲，$x_{ap}(t)$为仅包含单个周期的连续信号。

$x_0(t)$的傅里叶变换$X_0(j\omega)$依旧是一系列脉冲的和。

  

![cha4p1](res/cha4p1.png)

$$
X(j\omega) = X_{ap}(j\omega)X_0(j\omega)
$$
再根据其卷积特性可求得其傅里叶变换，可以得到，其形式为$X_{ap}(j\omega)$在$\omega = k \omega_0 ,k \in N$上的一系列脉冲，其值正好与源信号的傅里叶级数相对应。

  

**2. Convergence of  Fourier Transform / 傅里叶变换的收敛**

- 信号在时域内可积。
- 信号在有限区间内拥有有限个最大最小值。
- 信号在有限区间内拥有的不连续是数量与幅度均是有限的。


  

**3. Parseval's Relation / 帕塞瓦尔定理**
$$
\int_{-\infty}^{+\infty} |x(t)|^2 dt = {1\over 2 \pi}\int_{-\infty}^{+\infty} |X(j \omega)|^2 d\omega
$$
该式常用于在已知一个信号的傅里叶变换情况下求其能量。

​  

**4. Properties of Fourier Transform / 傅里叶变换性质**

连续傅里叶变换的诸多特性与第三章中傅里叶级数的性质有着紧密的相互联系。

0. 基本操作：

$$
x(at) \xrightarrow{FT} {1 \over |a|}X({j\omega \over a})
$$

1. 线性：

$$
Ax(t) + By(t) \xrightarrow{FT}AX(j\omega) + BY(j\omega)
$$

2. 时移特性：

$$
x(t-t_0) \xrightarrow{FT} e^{-j\omega t_0} X(j\omega)
$$

3. 频移特性：

   对于该特性，结合第6条的内容(式15)可以作进一步的解释，即把$x(t)$与$c(t) = cos(\omega_c t)$相乘(相调制)，其分别的傅里叶变换相卷积即可得到新的傅里叶变换。

   对于频域上为$X(j\omega) =\delta(\omega - \omega_c)$的$e^{j\omega_ ct}$, 其实就是发生了频移。

$$
x(t)e^{j\omega_c t} \xrightarrow{FT} X(j(\omega-\omega_c))
$$

4. 微分特性：

   将源信号视为具有不同初相的余弦信号的和，对原信号的微分操作可视为对其中的所有余弦信号的相位加上90度，再乘以因角速度不同产生的幅度差，比如$dsin(\omega t)/dt = \omega cos(\omega t)$。从频域看，即把$X(j\omega)$的相位乘以$\omega$并加上90度相差，结合相量运算，为$X_{90}(j\omega) = \omega \times 1\angle90^{\circ} \times X_0(j\omega) = j\omega X(j\omega)$，可以得到下式 : 

$$
{x(t) \over dt} \xrightarrow{FT} j\omega X(j\omega)
$$

5. 积分特性：

   按照微分性质的套路，对原信号的微分操作可视为对其中的所有余弦信号的相位减去90度，再除以因角速度不同产生的幅度差($dsin(\omega t)/dt = \omega cos(\omega t)$)。同时也可以将其理解为微分的逆操作：
   $$
   \int_{-\infty}^t x(t)dt \xrightarrow{FT} {1\over j\omega}X(j\omega)
   $$
   对于被积分式的傅里叶变换中$X(0) \neq 0$的情况，其更完整的表达式如下所示 :

$$
\int_{-\infty}^t x(t)dt \xrightarrow{FT} {1\over j\omega}X(j\omega) + \pi X(0) \delta(\omega)
$$

6. 相乘(调制)特性：

   两个信号相乘得到的信号，其傅里叶变换为两个源信号傅里叶变换的卷积。

$$
x(t)y(t) \xrightarrow{FT} {1 \over 2\pi} \int_R X(j\theta)Y(j(\omega-\theta))d\theta = {1\over 2\pi}X(j\omega)* Y(j\omega)
$$

7. 卷积特性：

   两个信号相卷积得到的信号，其傅里叶变换为两个源信号傅里叶变换相乘。

$$
x(t)*y(t) \xrightarrow{FT}X(j\omega)Y(j\omega)
$$



  

**4. 杂项**

- 一个纯实偶信号的傅里叶变换是纯实的偶函数。
- 一个纯实奇信号的傅里叶变换是纯虚的奇函数。
- 一个纯实信号的傅里叶变换是共轭对称的。
- 一个纯虚信号的傅里叶变换是共轭反对称的。