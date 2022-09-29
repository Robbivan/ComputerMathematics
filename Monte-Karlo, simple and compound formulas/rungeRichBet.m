clc
a=1;
b=8;
s=-cos(b)+cos(a);
h=1;
counter=0;
n=7;
alpha=1;
runge=1:n;
richardson=1:n;
beta=1:n;
arrayH=1:n;
for j=1:n
    h=h/2;
    int_left_rect=0;
    left_board=a;
    right_board=a+h;
    for i=a:h:b-h
        int_left_rect=int_left_rect+((right_board-left_board)*sin(left_board));
        left_board=left_board+h;
        right_board=right_board+h;
    end
     disp("left_reg")
     disp(int_left_rect)
        
     dh=h/2;
     left_board=a;
     right_board=a+dh;
     int_left_rect_2=0;
        
     for i=a:dh:b-dh
            int_left_rect_2=int_left_rect_2+((right_board-left_board)*sin(left_board));
            left_board=left_board+dh;
            right_board=right_board+dh;
     end
     disp("left_reg_2")
     disp(int_left_rect_2)
     runge(j)=((int_left_rect_2-int_left_rect)/(h^alpha))*((2^alpha)/((2^alpha)-1));
     richardson(j)=((2^alpha)*int_left_rect_2-int_left_rect)/((2^alpha)-1);
     beta(j)=log(abs( (s-richardson(j))/runge(j)))/log(h);
     arrayH(j)=h;
end
disp("runge (C)")
disp(runge)
disp("richardson")
disp(richardson)
disp('Beta')
disp(beta)

hold on
figure(1)
plot(arrayH,runge,"b")
title('Runge')
figure(2)
plot(arrayH,richardson,"r")
title('Richardson')
figure(3)
plot(arrayH,beta,"k")
title('Beta')
hold off
 