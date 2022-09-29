clc
a=3;
b=8;

h=1;
counter=0;
gen=13;
alpha_left_rect=1:gen;
alpha_middle_rect=1:gen;
alpha_int_trap=1:gen;
alpha_int_sims=1:gen;
arrayH=1:gen;
s=-cos(b)+cos(a);
for j=1:gen
    h=h/2;
    int_left_rect=0;
    int_middle_rect=0;
    int_trap=0;
    int_sims=0;
    left_board=a;
    right_board=a+h;
    for i=a:h:b-h
        int_left_rect=int_left_rect+((right_board-left_board)*sin(left_board));
        int_middle_rect=int_middle_rect+((right_board-left_board)*sin((left_board+right_board)/2));
        int_trap=int_trap+((right_board-left_board)*((sin(left_board)+sin(right_board))/2));
        int_sims=int_sims+((right_board-left_board)...
        *((sin(left_board)+4*sin((left_board+right_board)/2)+sin(right_board))/6));
        left_board=left_board+h;
        right_board=right_board+h;
    end
    d_left_rect=abs(s-int_left_rect);
    alpha_left_rect(j)=log(d_left_rect)/log(h);

    d_middle_rect=abs(s-int_middle_rect);
    alpha_middle_rect(j)=log(d_middle_rect)/log(h);

    d_int_trap=abs(s-int_trap);
    alpha_int_trap(j)=log(d_int_trap)/log(h);
    
    d_int_sims=abs(s-int_sims);
    alpha_int_sims(j)=log(d_int_sims)/log(h);

    arrayH(j)=h;
end

disp("left_reg")
disp(int_left_rect)

disp(alpha_left_rect)

disp("middle_rect")
disp(alpha_middle_rect)

disp("trap")
disp(alpha_int_trap)

disp("sims")
disp(alpha_int_sims)

hold on 
figure(1);
title('left rect');
plot(arrayH,alpha_left_rect,"b")



figure(2);
plot(arrayH,alpha_middle_rect,"r")
title('middle rect');


figure(3);
plot(arrayH,alpha_int_trap,"g")
title('trap');


figure(4);
plot(arrayH,alpha_int_sims,"m")
title('sims');
hold off







