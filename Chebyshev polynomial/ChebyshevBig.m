clc 
n=14;



left=-1;
right=20;

z=left:0.01:right;

arrayAB=1:n;
for i=1:n
resWithCosAB=(1/2)*((right-left)*cos(((2*i+1)*pi)/(2*n+2))+right+left);
arrayAB(i)=resWithCosAB;
end
disp(arrayAB);





y=sin(arrayAB);
A=1;

resForNumerator=1;
resForDenominator=1;
resTime=0;
for i=1:n
     for j=1:n
         if (i~=j)
                initNum=[A,-arrayAB(j)];
                initDen=arrayAB(i)-arrayAB(j);
                resForNumerator=conv(resForNumerator,initNum);
                resForDenominator=resForDenominator*initDen;
         end
     end
     resTime=((y(i)*resForNumerator)/resForDenominator)+resTime;
     resForNumerator=1;
     resForDenominator=1;
end 





h=(right-left)/(n-1);

xN=left:h:right;
yN=sin(xN);


nN=n;
resForNumeratorN=1;
insideIterator=0;
AN=1;
N=yN(1);

while (nN>1)
    N=conv(N,[0,1]);
    for t=1:(nN-1)
         q=yN(t+1)-yN(t);
         yN(t)=q;
    end
    insideIterator=insideIterator+1;
    forFactorial=factorial(insideIterator);
    initNum=[AN,-xN(insideIterator)];
    resForNumeratorN=conv(resForNumeratorN,initNum);
    N=N+((yN(1)*resForNumeratorN)/(forFactorial*h^insideIterator));
    nN=nN-1;
end
yN=sin(xN);



Xtemp=left:0.01:right;
YTemp=sin(Xtemp);


tempMax=0;
itter=0;
 for i=left:0.01:right
     itter=itter+1;
     temp=abs(polyval(resTime,i)-sin(i));
     
     if(tempMax<temp)
        tempMax=temp;
        yMax=[polyval(resTime,i),sin(i)];
        xMax=[i,i];
     end 
 end


 tempMax1=0;
 itter1=0;
 for i=left:0.01:right
     itter1=itter1+1;
     temp1=abs(polyval(N,i)-sin(i));
   
     if(tempMax1<temp1)
        tempMax1=temp1;
        yMax1=[polyval(N,i),sin(i)];
        xMax1=[i,i];
     end 
 end
 



 hold on
 figure(1);
 disp("Res")
 disp(tempMax);
 disp(tempMax1);
 disp(xMax);
 disp(yMax);
 disp(xMax1)
 disp(yMax1);
 plot(z,polyval(resTime,z),"r"),grid
 plot(z,polyval(N,z),"g"),grid
 plot (Xtemp,YTemp," b"),grid
 plot(xMax,yMax,":b")
 plot(xMax1,yMax1,"m")
 plot(arrayAB,y,"ok")
 plot(xN,yN,"*m")

 legend('Lagrange','Newton','Start Function (sin)')
 hold off
 
 
