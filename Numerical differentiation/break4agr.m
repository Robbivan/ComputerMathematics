clc
h=0.1;
deep=7;

alphaArray2=1:deep;
arrayH=1:deep;
for j=1:deep
    left=1;
    right=left+10*h;
%     n=((right-left)/h)+1;
    n=11;
%     disp(n)
    x=left:h:left+10*h;
    y=sin(x);
%     disp(y)
    y_d=cos(x);
    I4=1:n-4;
    x4_sec=1:n-4;
    for i=3:n-2
        I4(i-2)=(y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2))/(12*h);
        x4_sec(i-2)=x(i);
    end
    arrayNewX2=cos(x4_sec);
    tempMax2=0;
    for i=1:n-4
        temp1=abs(arrayNewX2(i)-I4(i));
        if(tempMax2<temp1)
            tempMax2=temp1;
        end 
    end
%     disp(tempMax2)
    alphaArray2(j)=log(tempMax2)/(log(h));
    disp(alphaArray2)
    arrayH(j)=h;
    h=h/1000;
    plot(arrayH,alphaArray2,"b")
end
