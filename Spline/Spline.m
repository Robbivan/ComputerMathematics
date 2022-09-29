clc 
n=3;


left=1;
right=20;

h=(right-left)/(n-1);
z=0:0.01:h;

x=left:h:right;
y=sin(x);

d=1:n-2;
if((n-2)>0)
    for e=1:2
        for t=1:(n-1)
            q=y(t+1)-y(t);
            y(t)=q;     
        end
    end
else 
    d=0;
end
for i=1:n-2
    d(i)=y(i);
end
d=d';


b1=0;
bn=0;

A=zeros(n-2,n-2);
for i=1:n-2
    for j=1:n-2
        if (i==j)
            A(i,j)=4;
        end
        if ((j-i)==1)
            A(i,j)=1;
        end
        if ((i-j)==1)
            A(i,j)=1;
        end
    end
end
if (n==2)
    A=0;
end
disp(A);


koefB=A^(-1)*d*3/(h^2);
for i=1:2
    koefB=conv(koefB,[0,1]);
end
for i=1:n-1
    koefB(i)=koefB(i+1);
end
koefB(n)=0;
koefB;


koefA=1:n;
for i=1:n-1
    koefA(i)=(koefB(i+1)-koefB(i))/(3*h);
end
koefA(n)=0;
koefA=koefA';

y=sin(x);
for t=1:(n-1)
     q=y(t+1)-y(t);
     y(t)=q;            
end
koefC=1:n;
for i=1:(n-1)
    koefC(i)=(y(i)/h)-(h*((2*koefB(i)+koefB(i+1))/3));
end
koefC(n)=0;
koefC=koefC';

koefD=sin(x);
koefD=koefD';
y=sin(x);


%  arrayShow(1)=koefA(1);
%  arrayShow(2)=koefB(1);
%  arrayShow(3)=koefC(1);
%  arrayShow(4)=koefD(i);
xD=left:0.01:right;
yD=sin(xD);


plot(xD,yD,"r")
hold on
figure(1)
for v=1:n-1
    resArray=[koefA(v),koefB(v),koefC(v),koefD(v)];
    disp(resArray);
    polgG=polyval(resArray,z);
    plot(z,polgG,"-g"),grid
    plot(x(v),y(v),"oc")
    plot(x(v)+z,polgG,"b"),grid
end 
plot(x(n),y(n),"oc")
hold off






