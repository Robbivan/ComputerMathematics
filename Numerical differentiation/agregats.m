clc
left=1;
right=5;
h=0.1;
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

% disp(tempMax1)
% disp(itter)



for i=2:n
    I1_sec(i-1)=(y(i)-y(i-1))/h;
    x1_dop_sec(i-1)=x(i);
end


I2=1:n-2;
x2_dop=1:n-2;
I2_sec=1:n-2;
x2_dop_sec=1:n-2;


for i=1:n-2
    I2(i)=(4*y(i+1)-3*y(i)-y(i+2))/(2*h);
    x2_dop(i)=x(i);
end
for i=2:n-1
    I2_sec(i-1)=(y(i+1)-y(i-1))/(2*h);
    x2_dop_sec(i-1)=x(i);
end



I4=1:n-4;
x4_sec=1:n-4;


for i=3:n-2
    I4(i-2)=(y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2))/(12*h);
    x4_sec(i-2)=x(i);
end




hold on
figure(1);
plot(x4_sec,I4,"c")
plot(x2_dop,I2,"m")

plot(x2_dop_sec,I2_sec,"k")
plot(x1_dop,I1,"r")
plot(x1_dop_sec,I1_sec,"g")
plot(x,y_d,"b")
legend('I4','I2','~I2','I1','~I1','cos')





    

