function P =  casc(v)

len = length(v);
d = lt_poly({1, 0; 0, [0 0 1]},0);
dist = lt_poly({[1 0 v(len)], 0; 0, [v(len) 0 1]},0);
P = eye(2);

for l = 1:len-3
    
    P = d * orth(pi*v(l)) * P;    
    
end

P = orth(pi*v(len-1)) * dist * orth(pi*v(len-2)) * P;


end