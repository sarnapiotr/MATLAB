function w = Newton(x,y)

N = size(x,2);
r = y;
for i = 2:N;
    for j = N:-1:i
        r(j) = ( r(j) - r(j-1) ) / ( x(j) - x(j-i+1) );
    end;
end;
 
w = r(N);
for i = N-1:-1:1
    w = conv(w,[-x(i) 1]); 
    w(1) = w(1) + r(i); 
end;

end