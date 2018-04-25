# 信号与系统

### 第九章 拉普拉斯变换

**1. Definition of Laplace Transform / 拉普拉斯变换定义**

拉普拉斯变换将信号从时域变换到复频域上(s-domain) :
$$
X(s) = \int_{-\infty}^{\infty} x(t)e^{-st}dt
$$

$$
s = \sigma + j\omega
$$

对于该变换,s存在一个R.O.C.(region of convergence)收敛域，使得上述积分可积。

收敛域只与实部$\sigma$相关，与$j\omega$无关，如:
$$
R.O.C: \Re\{s\} \in (5,+\infty)
$$
从复频域还原信号到时域的操作：
$$
f(t) = {1 \over 2\pi j}\lim_{T \to \infty}\int^{\sigma_0+T}_{\sigma_0 - T}e^{st}F(s)ds
$$

值得注意的是，相同的拉普拉斯变换不一定对应相同的源信号，需要配合收敛域进行判断。

  

**2. Properties of Laplace Transform / 拉普拉斯变换性质**

0. 基本操作

- R.O.C.收敛域与时域的相关性

  当一个信号的收敛域是位于右侧时，源信号位于最右极点右侧

  当一个信号的收敛域是位于左侧时，源信号位于最左极点左侧

  当一个信号的收敛域位于整个复频域时，源信号是时限的

  当一个信号的收敛域是位于两个极点之间的区域时，源信号位于整个时域

- 拉普拉斯变换中，$j\omega$轴上值即为$X(j\omega)$，即为傅里叶变换。

  当$j\omega$轴位于收敛域时，其傅里叶变换存在，否则不存在。

- 在处理**单边**周期信号时，可使用无穷多个单独的拉普拉斯变换项求和的方法：

$$
x(t) = x_0(t)* \sum^\infty_{n=0}\delta(t-nT)
$$

$$
X(s) = X_0(s) \times {1 \over 1 - e^{-Ts}}
$$

1. 线性

$$
Ax(t) + By(t) \xrightarrow{LT} AX(s)+BY(s)
$$

2. 积分/微分特性

$$
{dx(t) \over dt} \xrightarrow{LT}sX(s), \int_0^{t}x(t)dt \xrightarrow{LT} {1\over s}X(s)
$$

3. 频移特性

$$
e^{at}x(t) \xrightarrow{LT} X(s-a)
$$

4. 时移特性

$$
x(t-a) \xrightarrow{LT} e^{-as}X(s)
$$

5. 相乘/调制特性

$$
x(t)y(t) \xrightarrow{LT} {1 \over 2\pi j}X(s)Y(s), s \in R.O.C.
$$

6. 卷积特性

$$
x(t)*y(t) \xrightarrow{LT} X(s)Y(s)  
$$

  

**3. Initial/Final Value Theorem 初值/终值定理**
$$
\begin{cases}
x(0^+) = \lim_{s \to \infty}sF(s) \\
x(\infty) = \lim_{s \to 0}sF(s) \\
\end{cases}
$$


**4.ROC Merging / 收敛域合并杂项**

在两个拉普拉斯变换的收敛域合并时，可能出现零点和极点相消的情况，如:
$$
\Re\{s\} = {{s+1} \over s+2} \times {1 \over s+1} = {1 \over s+2}
$$

