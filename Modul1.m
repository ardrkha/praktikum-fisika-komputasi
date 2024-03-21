clc
clear 
close all  

disp('Kelompok 11')
disp('Modul 1 Persamaan Non Linear\n')
disp('Fumgsi F(x) = cos(x) - sqrt(x)')

%% METODE BISECTION
disp('METODE BISECTION')

y=@(x) cos(x) - sqrt(x);

A=0;
B=1;
Er=10^(-4);
imax=25;

FA=y(A);
FB=y(B);
Tol=abs(A-B);
i=0;

if FA==0
    fprintf('%d adalah akar\n',A);
 
elseif FB==0
    fprintf('%d adalah akar\n',B);
 
elseif FA*FB<0
    fprintf('i      A           B            x             Fx          Error\n');
 
    while i<imax
         i=i+1;
         X(i)=(A+B)/2;
         FX=y(X(i));
 
         fprintf('%d     %f     %f     %f     %f     %f\n',i,A,B,X(i),FX,Tol)
 
        if FX==0
            fprintf('%f adalah akar\n',X(i));
            return
        elseif y(A)*FX<0
            B=X(i);
        else
            A=X(i);
        end
        Tol=abs(A-B);
     end
else
 fprintf('Tidak ada akar atau Range yang dibuat terlalu besar\n')
end

i=1:i;
X=X(i);
figure
plot(i,X)

title('METODE BISECTION')
xlabel('iterasi')
ylabel('nilai x')
grid on

%% METODE NEWTON - RAPHSON
disp ('METODE NEWTON - RAPHSON')

y=@(x) cos(x) - sqrt(x);
dy=@(x) -1*sin(x) - (1/(2*sqrt(x)));

A=0;
B=1;
Er=10^(-4);
imax=25;

i=0;

FB=y(B);
DFB=dy(B);
X=B-(FB/DFB);
Tol=abs(X-B)/B;

if FB==0
    fprintf('%d adalah akar\n',B);
    
else
    fprintf('i     x0       x        Fx      Error\n');
    X=zeros(imax,1);
    
    while Tol>Er && i<imax
        i=i+1;
        X(i)=B-(y(B)/dy(B));
        FX=y(X(i));
        Tol=abs(X(i)-B);
        
        fprintf('%d %f %f %f %f\n',i,B,X(i),FX,Tol)
        
        B=X(i);
        
    end
end

i=1:i;
X=X(i);
figure
plot(i,X)

title('METODE NEWTON - RAPHSON')
xlabel('iterasi')
ylabel('nilai x')
grid on

