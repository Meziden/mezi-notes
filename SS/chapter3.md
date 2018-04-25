# 信号与系统

### 第三章 傅里叶级数

**1. Fourier Series / 傅里叶级数定义**

将一个连续的周期信号分解为一系列正弦信号的和，分别取其幅度，便得到傅里叶级数。

如下图$^1$所示，一个方波输入( 红色 )可以被分解为具有一倍、两倍及更多倍基本频率的正弦信号的叠加。

![cha3p1](res/cha3p1.png)

以频率倍数为序排列幅度( 蓝色 )，即得到傅里叶级数展开的数组$a_k$。

所以输入信号可以被视为：
$$
x(t) = \sum ^{+\infty} _{k=-\infty}a_k e^{jk \omega_0 t}
$$
$a_k$可以由式(2)得到：
$$
a_k = {1 \over T} \int _0 ^T x(t) e^{-j k \omega_0 t}dt
$$
$a_0$可视为信号的直流分量，即信号的平均值：
$$
a_0 = {1 \over T} \int_T x(t) dt
$$

  

**2e. Convergence of Fourier Series / 傅里叶级数收敛条件**

- 信号在周期内完全可积，如$x(t) = {1 \over t},t\in[0,1)$就违反该条件。
- 信号在周期内拥有有限个最大最小值，如$x(t) = sin({2\pi \over t}),t\in[0,1)$就违反该条件。
- 信号在周期内拥有的不连续是数量与幅度均是有限的。


  

**3. Properties of CT Fourier Series / 连续信号的傅里叶级数性质**

0. 基本操作：

$$
x(at) \xrightarrow{FS} a_k
$$

1. 线性：

$$
Ax(t) + By(t) \xrightarrow{FS}A a_k+B b_k
$$

2. 时移特性：
$$
x(t-t_0) \xrightarrow{FS} e^{-jk\omega t_0} a_k
$$

3. 频移特性：

   对于该特性，结合第6条的内容(式9)可以作进一步的解释，即把$x(t)$与$c(t) = cos(M\omega _0 t)$相乘(相调制)，其分别的傅里叶级数相卷积即可得到新的傅里叶级数。

   对于傅里叶级数只在M上有值的$e^{j M\omega_0 t}$, 其实就是发生了频移。

$$
e^{j M \omega_0 t}x(t) \xrightarrow{FS} a_{k-M}
$$

4. 微分特性：

   将源信号视为具有不同初相的余弦信号的和，对原信号的微分操作可视为对其中的所有余弦信号的相位加上90度，再乘以因角速度不同产生的幅度差，比如$dsin(k\omega_0 t)/dt = k\omega_0 cos(k\omega_0 t)$。从傅里叶级数看，即把$a_k$的相位乘以$k\omega_0$并加上90度相差，结合相量运算法则，为$a_{k90} = k \omega_0 \times 1\angle90^{\circ} \times a_{k0} = jk\omega_0a_{k0}$，可以得到下式 : 

$$
{d x(t) \over dt} \xrightarrow{FS} jk\omega _0 a_k
$$

5. 积分特性：

   按照微分性质的套路，对原信号的微分操作可视为对其中的所有余弦信号的相位减去90度，再除以因角速度不同产生的幅度差($dsin(k\omega_0 t)/dt = k\omega_0 cos(k\omega_0 t)$)。同时也可以将其理解为微分的逆操作：

$$
\int_{-\infty}^t x(t)dt \xrightarrow{FS} -j{1 \over k\omega_0}a_k = {1\over jk \omega_0}a_k
$$

6. 相乘(调制)特性：

   两个信号相乘得到的信号，其傅里叶级数为两个源信号傅里叶级数的卷积。

$$
x(t)y(t) \xrightarrow{FS} \sum_{k \in Z}a_lb_{k-l}
$$

7. 帕塞瓦尔定理 具有傅里叶级数特色的版本：

$$
{1\over T}\int_Tx(t)^2dt = \sum_{k \in Z} |a_k|^2
$$



  

**4.杂项**

在习题中出现如下表达式：
$$
a_3 = a^*_{-3}=4j
$$
此处符号“$*$”表示该值的对偶，而非在部分推导式出现的$a^*_n$中所表示的反向排序操作。

