clc 
n=17;
left=1;
right=10;
h=(right-left)/(n-1);
z=left:0.1:right;
x=left:h:right;
y=sin(x);
A=1;
resForNumerator=1;
resForDenominator=1;
resTime=0;
 for i=1:n
     for j=1:n
         if (i~=j)
                initNum=[A,-x(j)];
                initDen=x(i)-x(j);
                resForNumerator=conv(resForNumerator,initNum);
                resForDenominator=resForDenominator*initDen;
         end
     end
     resTime=((y(i)*resForNumerator)/resForDenominator)+resTime;
     resForNumerator=1;
     resForDenominator=1;
 end
 u=polyval(resTime,z);
 disp("it's koef lagrange");
 display(resTime);
 figure(1),plot(z,u,x,y,"*r"),grid
 legend("Lagrange")