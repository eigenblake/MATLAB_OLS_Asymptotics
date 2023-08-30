%%%%%%This code is part of a homework assignment for a PhD level
%%%%%%Microeconometrics course at North Carolina State University. The
%%%%%%purpose of Question 1, Part A is to use a random DGP process to illustrate asymptotic properties
%%%%%%of OLS. Specifically, when regressors are uncorellated with error
%%%%%%terms, then the estimator is efficient, unbiased and consistent. This
%%%%%%is illustrated through the corresponding histograms. 

%%%%%%In part b, I show how OLS estimators become biased when error terms
%%%%%%are correlated with regressors. I employ cholesky decomposition to
%%%%%%generate a variance-covariance matrix that expresses these
%%%%%%correlations. The histogram illustrates the biasedness of the
%%%%%%estimators. The respective correlations are listed above each loop.


%%%%%%%%%%Question 1%%%%%%%%%%
%%Part (a)
%Iteration - population 50
rng(111)
for i=1:1000;
X1 = normrnd(0, 1, [50, 1]);
U1 = normrnd(0, 1, [50, 1]);
Y1 = 1 + X1 + U1;
betahat1 = inv(X1'*X1)*X1'*Y1;
beta1(i) = betahat1;
end;

mean50 = mean(beta1)
hist50 = histogram(beta1)
var50 = var(beta1)

%Iteration - population 500
rng(111)
for i=1:1000;
X2 = normrnd(0, 1, [500, 1]);
U2 = normrnd(0, 1, [500, 1]);
Y2 = 1 + X2 + U2;
betahat2 = inv(X2'*X2)*X2'*Y2;
beta2(i) = betahat2;
end;

mean500 = mean(beta2)
hist500 = histogram(beta2)
var500 = var(beta2)

%Iteration - population 5000
rng(111)
for i=1:1000;
X3 = normrnd(0, 1, [5000, 1]);
U3 = normrnd(0, 1, [5000, 1]);
Y3 = 1 + X3 + U3;
betahat3 = inv(X3'*X3)*X3'*Y3;
beta3(i) = betahat3;
end;

mean5000 = mean(beta3)
hist5000 = histogram(beta3)
var5000 = var(beta3)

%%Part (b)

%Correlation: -0.2 (Biased, consistent estimator)
rng(111)
for i=1:1000;
mu = 0;
sigma = 1;
M1 = mu + sigma*randn(50, 2);
R1 = [1, -0.2; -0.2, 1];
L1 = chol(R1);
M1 = M1*L1;
x1 = M1(:,1);
u1 = M1(:,2);
y1 = 1 + x1 + u1;
betahat4 = inv(x1'*x1)*x1'*y1;
beta4(i) = betahat4;
end;

negative_corr_mean = mean(beta4)
negative_corr_hist = histogram(beta4)
negative_corr_var = var(beta4)

%Correlation: 0 (Unbiased, consistent estimator)
rng(111)
for i=1:1000;
mu = 0;
sigma = 1;
M2 = mu + sigma*randn(50, 2);
R2 = [1, 0; 0, 1];
L2 = chol(R2);
M2 = M2*L2;
x2 = M2(:,1);
u2 = M2(:,2);
y2 = 1 + x2 + u2;
betahat5 = inv(x2'*x2)*x2'*y2;
beta5(i) = betahat5;
end;

zero_corr_mean = mean(beta5)
zero_corr_hist = histogram(beta5)
zero_corr_var = var(beta5)

%Correlation: 0.2 (Biased, consistent estimator)
rng(111)
for i=1:1000;
mu = 0;
sigma = 1;
M3 = mu + sigma*randn(50, 2);
R3 = [1, 0.2; 0.2, 1];
L3 = chol(R3);
M3 = M3*L3;
x3 = M3(:,1);
u3 = M3(:,2);
y3 = 1 + x3 + u3;
betahat6 = inv(x3'*x3)*x3'*y3;
beta6(i) = betahat6;
end;

positive_corr_mean = mean(beta6)
positive_corr_hist = histogram(beta6)
positive_corr_var = var(beta6)

