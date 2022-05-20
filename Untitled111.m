%清除变量%
clear
clc
%参数设置%
c = 15;%与MU参与水平相关的每单位成本 the MU's unit cost associated to its participation level
mu = 0.1;%表示与MU参与水平等价的金钱价值 the parameter representing the equivalent monetary worth of MUs' participation level
s = 20;%从所有移动用户的总贡献中获取的利润的凹度系数 the coefficients capturing the concavity of the profit obatined from the total contribution of all MUs
t = 0.05;%与s都为凹度系数
%绘图&
 
for i=1:1:10
    a=normrnd(15,2,[i 1]);%表示不同的移动用户的内在系数
    b=normrnd(15,2,[i 1]);%a和b都为MU的内在系数
    g=normrnd(0.05,1,[i i]);%社交网络效应 gij表示MUj对MUi的影响 g将gij表示成矩阵形式
    G=abs(g);%对g取绝对值）
    l=(ones(i,1))';%
    UI=eye(i);%单位矩阵
    B=diag(b);%将b转换为对角矩阵
    K=inv(B-G);%求B-G的逆矩阵
    r=(inv(2*UI+2*mu*t*(K)))*(mu*(s*l-2*t*(K)*(a-c*l))-(a-c*l));%CSP提供给MU的报酬 the offered reward to MU from the CSP
    X=(K)*(a+r-c*l);%MU的参与水平 the participation level of the mu
    pai=mu*(s.*(l').*X);% CSP的收益 the revenue of the CSP
end

