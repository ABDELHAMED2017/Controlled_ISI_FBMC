%%% ------ 4/4 Transmultiplexer ----- %%%

clear;
close all;
clc;
N = 2;                      % Number of carriers
K = 2;                      % Upsampling

%global h;
d1 = lt_poly({1;[0 1]},0);
%d = lt_poly({1, 0; 0, [0 0 1]},0);
%dist = lt_poly({[1 0 0.5], 0; 0, [0.5 0 1]},0);

%%%%%%%-----test-test -------%%%%%%%
tic;

v10 = [2*(rand(1,6)-0.5) 0.5];

%v1 = [0.491487314620871,-0.944261455936450,-0.116241306117775,-0.516241051196063,0.941444198611090,0.392773461598325,0.647182949597277];

fun = @solv_rot;
options = optimoptions('lsqnonlin','Display','iter');
options.MaxFunEvals = 5000;
options.MaxIter = 4800;
options.TolFun = 1e-12;
options.TolX = 1e-12;

v1 = lsqnonlin(fun,v10,-(ones(1,length(v10))),(ones(1,length(v10))),options);

P = casc(v1);

Y = d1'*P;
coef = GetCoefs(Y);

a = coef{1};
b = coef{2};

plot(20*log10(abs(fft(a,1024))));
figure
plot(20*log10(abs(fft(b,1024))));
%plot(abs(fft(a,1024)).^2 + abs(fft(b,1024)).^2);

toc;