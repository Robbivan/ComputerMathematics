    clc 
m=100;
arr=1:m-2;  
al=1:m-2;


left=1;
right=20;


for n=3:m
    h=(right-left)/(n-1);
    z=0:0.01:h;
    
    
    x=left:h:right;
    y=sin(x);
    
    d=1:n-2;
    if((n-2)>0)
        for e=1:2
            for t=1:(n-1)
                q=y(t+1)-y(t);
                y(t)=q;     
            end
        end
    else 
        d=0;
    end
    for i=1:n-2
        d(i)=y(i);
    end
    d=d';
    
    
    b1=0;
    bn=0;
    
    A=zeros(n-2,n-2);
    for i=1:n-2
        for j=1:n-2
            if (i==j)
                A(i,j)=4;
            end
            if ((j-i)==1)
                A(i,j)=1;
            end
            if ((i-j)==1)
                A(i,j)=1;
            end
        end
    end
    if (n==2)
        A=0;
    end
    disp(A);
    
    
    koefB=A^(-1)*d*3/(h^2);
    for i=1:2
        koefB=conv(koefB,[0,1]);
    end
    for i=1:n-1
        koefB(i)=koefB(i+1);
    end
    koefB(n)=0;
    koefB;
    
    
    koefA=1:n;
    for i=1:n-1
        koefA(i)=(koefB(i+1)-koefB(i))/(3*h);
    end
    koefA(n)=0;
    koefA=koefA';
    
    y=sin(x);
    for t=1:(n-1)
         q=y(t+1)-y(t);
         y(t)=q;            
    end
    koefC=1:n;
    for i=1:(n-1)
        koefC(i)=(y(i)/h)-(h*((2*koefB(i)+koefB(i+1))/3));
    end
    koefC(n)=0;
    koefC=koefC';
    
    koefD=sin(x);
    koefD=koefD';
    y=sin(x);
    
    
    %  arrayShow(1)=koefA(1);
    %  arrayShow(2)=koefB(1);
    %  arrayShow(3)=koefC(1);
    %  arrayShow(4)=koefD(i);
    xD=left:0.01:right;
    yD=sin(xD);
    
    arrayMaxLength=1:(n-1);
    arrayMaxX=zeros(n-1,2);
    arrayMaxY=zeros(n-1,2);
    
    
    
    
    
    
    for v=1:n-1
        resArray=[koefA(v),koefB(v),koefC(v),koefD(v)];
        disp(resArray);
    
        counter=0;
        tempMax=0;
        for j=x(v):0.01:(x(v)+h-0.01)
            counter=counter+0.01;
            temp=abs(polyval(resArray,counter)-sin(j));
            if(tempMax<temp)
                tempMax=temp;
                yMax=[polyval(resArray,counter),sin(j)];
                xMax=[j,j];
           end 
        end
        arrayMaxLength(v)=tempMax;
        for iter=1:2
            arrayMaxX(v,iter)=xMax(iter);
            arrayMaxY(v,iter)=yMax(iter);
        end
       
    end 
    goMax=arrayMaxLength(1);
    saveI=1;
    for i=2:n-1
        tempGoMax=arrayMaxLength(i);
        if (tempGoMax>goMax)
            goMax=tempGoMax;
            saveI=i;
        end
    end
    for i=1:n-1
        if (i==saveI)
            for iter=1:2
                xMax(iter)=arrayMaxX(i,iter);
                yMax(iter)=arrayMaxY(i,iter);
            end
        end
    end
    al(n-2)=-log(goMax)/(log(n));
    arr(n-2)=goMax;
end
justX=1:m-2;
justAl=1:m-2;
figure(1)
plot(justX,arr),grid
figure(2)
plot(justAl,al,"gr"),grid







