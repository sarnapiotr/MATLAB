clear;
clc; 

format compact; 

x = [0 1 2 3 4 5 -2] 

w = [1, - 5, 5, - 2, 1] 
w = fliplr(w); 
y = polyval(fliplr(w),x); 

wL = Lagrange(x,y);
wN = Newton(x,y); 

Nw = size(w,2);
Ni = size(wN,2);
N = max(Nw,Ni); 

if (Nw < N)    
    w(N) = 0;
elseif (Ni < N) 
    wL(Nw) = 0;  
    wN(Nw) = 0; 
end;  

dwL = w - wL;
dwN = w - wN;

tbl=[(0:N-1)', w', wL', dwL', wN', dwN']; 
disp('                                                             ') 
disp('    NrWsp    WielInt    WielLag   BladLag  WielNew   BladNew') 

format short e; 
disp(tbl); 

xx = linspace(min(x),max(x),1000);
yy = polyval(fliplr(wL),xx); 

plot(x,y,'ko'); 
hold on 
plot(xx,yy,'b-'); 
yy = polyval(fliplr(wN),xx); 
plot(xx,yy,'r--'); 
yy = polyval(fliplr(w),xx); 
plot(xx,yy,'k:'); 
title('Interpolacja wielomianu 4 stopnia'); 
xlabel('x'); 
ylabel('W(x)'); 
legend('Punkty int.','W. Lagrange''a','W. Newtona','w. interpolowany','Location','best'); 

hold off 
