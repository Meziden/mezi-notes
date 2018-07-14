# 信号与系统

### 第五章 离散时间傅里叶变换

**1. DTFT / Discrete-Time Fourier Transform**

离散傅里叶变换的变换对如下所示：
$$
X(e^{j\omega}) = \sum_{n \in Z}x[n]e^{-j\omega n}
$$

$$
x[n] = {1 \over 2\pi} \int_{2\pi}X(e^{j\omega}) e^{j\omega n}d\omega
$$

对于离散时间傅里叶变换，其与连续时间傅里叶变换最大的区别在于其变换结果在频域上呈现周期性，其周期为$2\pi$。

![cha5p1](res/cha5p1.png)

这种性质可以被理解为，离散信号是连续信号被调制(相乘，亦可视为取样)在一系列T=1的脉冲上的结果，而这样经过脉冲调制的信号在频域上即呈现出具有$2\pi$周期的频域特征，在第七章/信号采样可获得更多的相关信息。

  

**1a. Periodic Signal / 周期信号**

对于周期信号，直接计算不易求得其离散时间傅里叶变换，可以借鉴 第四章/1a.周期信号 中的方法，将源信号转换为一个非周期信号与一系列脉冲的卷积和：

![cha5p1](res/cha5p2.png)
$$
x[n] = x_0[n]*x_{ap}[n]\\
X(e^{j\omega}) = X_0(e^{j\omega})X_{ap}(e^{j\omega})
$$
可以得到，其形式为$X_{ap}(e^{j\omega})$在一系列脉冲上的取值，其值与傅里叶级数相对应。

注：该图中“DFT”用DFS描述其实更加准确，因为DFS有周期性而DFT是有限长的。

  

**2. Parseval's Relation / 帕塞瓦尔定理**
$$
\sum_{n=-\infty}^{+\infty} |x[n]|^2 dt = {1\over 2 \pi}\int_{2\pi} |X(e^{j \omega})|^2 d\omega
$$
该式常用于在已知一个信号的离散时间傅里叶变换情况下求其能量。

  

**3. Properties of DTFT / 离散时间傅里叶变换的性质**

1. 线性

$$
Ax[n]+By[n] \xrightarrow{DTFT} AX(e^{j\omega})+BY(e^{j\omega})
$$



2. 时移特性：

$$
x[n-n_0] \xrightarrow{DTFT} e^{-j\omega n_0}X(e^{j\omega})
$$

3. 频移特性：

   对于该特性，结合后面涉及到的调制特性可以作进一步的解释，即把$x[n]$与$c[n] = e^{j\omega_c n}$相乘(相调制)，其分别的傅里叶变换相卷积即可得到新的傅里叶变换。

   对于频域上为$X(e^{j\omega}) =\delta(\omega - \omega_c)$的$e^{j\omega_ cn}$, 其实就是发生了频移。

$$
x[n]e^{j\omega_c n} \xrightarrow{DTFT} X(e^{j(\omega-\omega_c)})
$$

4. 微分特性

   与连续时间傅里叶变换中所表述的“微分”不同，使用连续傅里叶变换得到的微分/积分特性，仅仅能用于描述离散时间傅里叶变换中源信号包络线的微分/积分情况，而不能正确取得积分/微分的准确值。

$$
   x[n] - x[n-1] \xrightarrow{DTFT} (1-e^{-j\omega})X(e^{j\omega})
$$

5. 积分特性

   根据上一条的描述，积分可被视为微分的逆运算，得到 :

$$
\sum^n_{k=-\infty} x[k] \xrightarrow{DTFT} {1\over 1- e^{-j\omega}}X(e^{j\omega})
$$

6. 调制特性

   两个信号相乘得到的信号，其离散时间傅里叶变换为两个源信号变换的卷积 :

$$
x[n]y[n] \xrightarrow{DTFT} {1\over 2\pi}X(e^{j\omega})*Y(e^{j\omega})
$$

7. 卷积特性

   两个信号相卷积得到的信号，其离散时间傅里叶变换为两个源信号变换相乘。

$$
x[n]*y[n] \xrightarrow{DTFT}X(e^{j\omega})Y(e^{j\omega})
$$

  

**4. 杂项**

- 一个纯实偶信号的离散时间傅里叶变换是纯实的偶函数。
- 一个纯实奇信号的离散时间傅里叶变换是纯虚的奇函数。
- 一个纯实信号的离散时间傅里叶变换是共轭对称的。
- 一个纯虚信号的离散时间傅里叶变换是共轭反对称的。



