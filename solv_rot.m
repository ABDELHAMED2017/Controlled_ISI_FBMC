function F = solv_rot(v)

epsilon = 64;

d1 = lt_poly({1;[0 1]},0);
%d = lt_poly({1, 0; 0, [0 0 1]},0);
%dist = lt_poly({[1 0 v(5)], 0; 0, [v(5) 0 1]},0);

%P = orth(v(4))*d* orth(v(3))*d*orth(v(2))*d* orth(v(1));
%P = orth(pi*v(4))*dist* orth(pi*v(3))*d*orth(pi*v(2))*d* orth(pi*v(1));
P = casc(v);

Y = d1'*P;
coef = GetCoefs(Y);

af = fft(coef{1},1024);

x1 = abs(af(256+epsilon: 512))/1024;

F = abs(x1);

end