clc 
n=51;


left=1;
right=5;
z=left:0.1:right;

h=(right-left)/(n-1)


xN=left:h:right;
yN=sin(xN);

nN=n;

resForNumeratorN=1;
insideIterator=0;
AN=1;
N=yN(1);

while (nN>1)
    N=conv(N,[0,1]);
    for i=1:(nN-1)
         q=yN(i+1)-yN(i);
         yN(i)=q;
    end
    insideIterator=insideIterator+1;
    forFactorial=factorial(insideIterator);
    initNum=[AN,-xN(insideIterator)];
    resForNumeratorN=conv(resForNumeratorN,initNum);
    N=N+((yN(1)*resForNumeratorN)/(forFactorial*h^insideIterator));
    nN=nN-1;
end
yN=sin(xN);
disp("it's koef newton:")
display(N);
figure(1),plot(z,polyval(N,z),'r',xN,yN,"ob"),grid
legend("Newton")

