% Solves the schrödinger equation with wave propagation for a spesific 
% Hamiltonian

% Clear memory and set format for output to screen
clear all
format short e

% Parametre and start value
epsilon = 1;
gamma = 0;
omega = 1i;
Psi = [1; 0];

% Set timesteps
dt = 0.01;
T = 10;
tVector = 0:dt:T;

% Formula for hamilton operator and propagator
H = [-epsilon/2 omega; omega ((epsilon/2)-(gamma*1i))];
U = expm(-1i*H*dt);

a = zeros(size(tVector));
norm = zeros(size(tVector));
PsiArray = zeros(2,size(tVector,1));
index = 1;

for t=tVector
    a(index) = abs(Psi(1))^2;
    norm(index) = abs(Psi(1))^2 + abs(Psi(2))^2;
    PsiArray(1,index) = Psi(1);
    PsiArray(2,index) = Psi(2);
    Psi = U*Psi;
    index = index+1;
end

figure('Position', [400, 400, 1000, 400])
axes
axis('square');
subplot(1,2,1)
plot(tVector, a);
title('Probability');

subplot(1,2,2)
plot(tVector, norm);
title('Norm');