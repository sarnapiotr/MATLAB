function w = Lagrange(x,y)

N = size(x,2);
w = 0;
for i = 1:N
    wi = y(i);
    for j = 1:N
        if (i~=j)
            wi = conv(wi,[-x(j) 1]) / ( x(i) - x(j) ); 
        end;
    end;
    w = w + wi;
end;

end