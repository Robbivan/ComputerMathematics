clc
left=1;
right=5;
h=0.001;
deep=5;
alphaArray1=1:deep;
alphaArray2=1:deep;
arrayH=1:deep;
for j=1:deep
    n=((right-left)/h)+1;
    
    x=left:h:right;
    y=sin(x);
    y_d=cos(x);

    I2=1:n-2;
    x2_dop=1:n-2;
    I2_sec=1:n-2;
    x2_dop_sec=1:n-2;
    for i=1:n-2
        I2(i)=(4*y(i+1)-3*y(i)-y(i+2))/(2*h);
        x2_dop(i)=x(i);
    end
    arrayNewX1=cos(x2_dop);
    tempMax1=0;
    for i=1:n-2
        temp=abs(arrayNewX1(i)-I2(i));
        if(tempMax1<temp)
            tempMax1=temp;
        end 
    end
    alphaArray1(j)=log(tempMax1)/(log(h));
    
    for i=2:n-1
        I2_sec(i-1)=(y(i+1)-y(i-1))/(2*h);
        x2_dop_sec(i-1)=x(i);
    end
    arrayNewX2=cos(x2_dop_sec);
    tempMax2=0;
    for i=1:n-2
        temp1=abs(arrayNewX2(i)-I2_sec(i));
        if(tempMax2<temp1)
            tempMax2=temp1;
        end 
    end
    alphaArray2(j)=log(tempMax2)/(log(h));
    arrayH(j)=h;
    h=h/3;
end

hold on 
figure(1)
plot(arrayH,alphaArray1,"g")
plot(arrayH,alphaArray2,"b")
legend('I2','~I2')
hold off