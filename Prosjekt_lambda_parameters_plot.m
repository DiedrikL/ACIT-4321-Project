% Plot effect of different gamma and omega values, with all gamma values
% real, and all omega values imaginary

% Clear memory and set format for output to screen
clear all
format short e

% Grid parameters
L = 40;
N = 200;

% Set up the grid.
x = linspace(-L/2,L/2,N);  
y = linspace(0,L/2,N);

hold on
LambdaOne = @(gamma,omega) -1i.*gamma./2+sqrt(-gamma.^2-2i.*gamma+1+4*(omega*1i).^2)./2;
LambdaTwo = @(gamma,omega) -1i.*gamma./2-sqrt(-gamma.^2-2i.*gamma+1+4*(omega*1i).^2)./2;
z1=zeros(N,N);
z2=zeros(N,N);
for n=1:N
    for m=1:N
        
        lambda1=LambdaOne(y(n),x(m));
        lambda2=LambdaTwo(y(n),x(m));
        
        z1(n,m)=lambda1;
        z2(n,m)=lambda2;
    end
end

hold off
mesh(x,y,imag(z1))
title('Imaginary lambda one')
xlabel('Omega');
ylabel('Gamma');

%pause
%mesh(x,y,real(z1));
%title('Real One')
%xlabel('Omega');
%ylabel('Gamma');

pause
mesh(x,y,imag(z2))
title('Imaginary lambda two')
xlabel('Omega');
ylabel('Gamma');

%pause
%mesh(x,y,real(z2));
%title('Real two')
%xlabel('Omega');
%ylabel('Gamma');


