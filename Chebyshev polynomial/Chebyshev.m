clc 
z=-1.1:0.01:1.1;

left=0;
right=10;

n=7;




dopX=[1,0];
T1=[0,0,1];
T2=[1,0];
for i=1:n-1
    T3=2*conv(dopX,T2)-T1;
    T1=T2;
    T1=conv(T1,[0,1]);
    T1=conv(T1,[0,1]);
    T2=T3;     
end  
array=0:n;
for i=0:n
% resWithCos=cos(((pi/2)+i*pi)/(n+1));
resWithCos=cos(((2*i+1)*pi)/(2*n));
array(i+1)=resWithCos;
end

disp(T3)

% resX=roots(T3);
resY=polyval(T3,array);

disp(roots(T3));
figure(1),plot(z,polyval(T3,z),"g",array,resY,"ob"),grid
legend("Chebyshev");



disp("Classic -1,1");
disp(array);

arrayAB=0:n;
for i=0:n
resWithCosAB=(1/2)*((right-left)*cos(((2*i+1)*pi)/(2*n+2))+right+left);
arrayAB(i+1)=resWithCosAB;
end

disp("it's A and B");
disp(arrayAB);