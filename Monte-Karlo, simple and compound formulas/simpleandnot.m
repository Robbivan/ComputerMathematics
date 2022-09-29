clc
a=3;
b=8;

h=1;
counter=0;
int_left_rect=0;
left_board=a;
right_board=a+h;
for i=a:h:b-h
    int_left_rect=int_left_rect+((right_board-left_board)*sin(left_board));
    left_board=left_board+h;
    right_board=right_board+h;
end
disp("left_rect")
disp(int_left_rect)

left_board=a;
right_board=a+h;

int_middle_rect=0;
for i=a:h:b-h
    int_middle_rect=int_middle_rect+((right_board-left_board)*sin((left_board+right_board)/2));
    left_board=left_board+h;
    right_board=right_board+h;
end
disp("middle_rect")
disp(int_middle_rect)

int_trap=0;

left_board=a;
right_board=a+h;

for i=a:h:b-h
    int_trap=int_trap+((right_board-left_board)*((sin(left_board)+sin(right_board))/2));
    left_board=left_board+h;
    right_board=right_board+h;
end
disp("trap")
disp(int_trap)


int_sims=0;
left_board=a;
right_board=a+h;

for i=a:h:b-h
    int_sims=int_sims+((right_board-left_board)...
        *((sin(left_board)+4*sin((left_board+right_board)/2)+sin(right_board))/6));
    left_board=left_board+h;
    right_board=right_board+h;
end
disp("sims")
disp(int_sims)



