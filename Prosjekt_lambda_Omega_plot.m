% Plots the effect of imaginary and real values for omega, with gamma as 
% a set constant and epsilon always 1

% Clear memory and set format for output to screen
clear all
format short e

% Gamma parameter
gamma=5;

% Grid parameters
L = 10;
N = 200;

% Set up the grid.
x = linspace(-L/2,L/2,N);     
y = linspace(0,L/2,N);

% Lambda formulas
LambdaOne = @(omega) -1i.*gamma./2+sqrt(-gamma.^2-2i.*gamma+1+4*(omega).^2)./2;
LambdaTwo = @(omega) -1i.*gamma./2-sqrt(-gamma.^2-2i.*gamma+1+4*(omega).^2)./2;
z1=zeros(N,N);
z2=zeros(N,N);

% Compute lambda 1, 2
[X,Y]=meshgrid(x,x);
Grid=X+Y.*1i;
z1=LambdaOne(Grid);
z2=LambdaTwo(Grid);
% z3=sqrt(4.*Grid.^2)/2;

C = zeros(N,N);
% Setup for color map
for n=1:N
    for m=1:N
      if imag(z1(m,n))>0
          C(m,n)=1;
      else
          C(m,n)=0;
      end
    end
end

D = zeros(N,N);

for n=1:N
    for m=1:N
      if imag(z2(m,n))>0
          D(m,n)=1;
      else
          D(m,n)=0;
      end
    end
end

% for n=1:N
%     for m=1:N
%       if imag(z3(m,n))>0
%           E(m,n)=1;
%       else
%           E(m,n)=0;
%       end
%     end
% end

F = C + D;

hold off
figure(1)
subplot(2,2,1)
mesh(X,Y,imag(z1),C)
view(2)
title('Img lambda 1')
xlabel('Real');
ylabel('Imaginary');

subplot(2,2,2);
mesh(X,Y,imag(z2),D)
view(2)
title('Img lambda 2')
xlabel('Real');
ylabel('Imaginary');

subplot(2,2,3)
mesh(X,Y,imag(z1))
title('Img lambda 1')
xlabel('Real');
ylabel('Imaginary');

subplot(2,2,4);
mesh(X,Y,imag(z2))
title('Img lambda 2')
xlabel('Real');
ylabel('Imaginary');

pause
figure(2)
mesh(X,Y,imag(z1))
title('Img lambda 1')
xlabel('Real');
ylabel('Imaginary');

figure(3)
mesh(X,Y,imag(z2))
title('Img lambda 2')
xlabel('Real');
ylabel('Imaginary');

figure(4)
mesh(X,Y,F)
view(2)
title('Combined sign');
xlabel('Real');
ylabel('Imaginary');




% pause
% figure(5)
% mesh(X,Y,imag(z3))
% title('Img lambda gamma 0')
% xlabel('Real');
% ylabel('Imaginary');
% 
% figure(2)
% mesh(X,Y,imag(z3),E)
% view(2)
% title('Img lambda gamma 0')
% xlabel('Real');
% ylabel('Imaginary');
