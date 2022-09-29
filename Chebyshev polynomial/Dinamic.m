clc 
left=1;
right=5;

numbMaxFromN=20;

al=0;

arrayAl=1:numbMaxFromN;
arrayRes=1:numbMaxFromN;
for n=1:numbMaxFromN
    
    arrayAB=1:n;
    for i=1:n
    resWithCosAB=(1/2)*((right-left)*cos(((2*i+1)*pi)/(2*n+2))+right+left);
    arrayAB(i)=resWithCosAB;
    end

    y=sin(arrayAB);
    A=1;
    z=left:0.01:right;
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
 tempMax=0;
 itter=0;
 for i=left:0.01:right
     itter=itter+1;
     temp=abs(polyval(resTime,i)-sin(i));
    
     if(tempMax<temp)
        tempMax=temp;
        alMax=(-log(abs(polyval(resTime,i)-sin(i))))/log(n);
        yMax=[polyval(resTime,i),sin(i)];
        xMax=[i,i];
     end 
 end
 
 arrayRes(n)=tempMax;
 arrayAl(n)=alMax;
 allX=1:numbMaxFromN;
 allx2=1:numbMaxFromN;
 figure(1)
 plot(allX,arrayRes),grid
 figure(2)
 plot(allx2,arrayAl,"g"),grid

end

