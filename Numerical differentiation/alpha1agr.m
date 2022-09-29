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
    I1=1:n-1;
    I1_sec=1:n-1;
    x=left:h:right;
    x1_dop=1:n-1;
    x1_dop_sec=1:n-1;
    y=sin(x);
    y_d=cos(x);
    for i=1:n-1
       I1(i)=(y(i+1)-y(i))/h;
       x1_dop(i)=x(i);
    end
    arrayNewX1=cos(x1_dop);
    tempMax1=0;
    for i=1:n-1
        temp=abs(arrayNewX1(i)-I1(i));
        if(tempMax1<temp)
            tempMax1=temp;
        end 
    end
   
    alphaArray1(j)=log(tempMax1)/(log(h));
    for i=2:n
        I1_sec(i-1)=(y(i)-y(i-1))/h;
        x1_dop_sec(i-1)=x(i);
    end
    arrayNewX2=cos(x1_dop_sec);
    tempMax2=0;
    for i=1:n-1
        temp1=abs(arrayNewX2(i)-I1_sec(i));
        if(tempMax2<temp1)
            tempMax2=temp1;
        end 
    end
    alphaArray2(j)=log(tempMax2)/(log(h));
    arrayH(j)=h;
    h=h/8;
end

hold on 
figure(1)
plot(arrayH,alphaArray1,"g")
plot(arrayH,alphaArray2,"b")
legend('I1','~I1')
hold off


