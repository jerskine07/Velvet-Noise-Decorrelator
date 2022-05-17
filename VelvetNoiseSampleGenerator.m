%Velvet noise decorrelator - Function reproducing figure 1c from DAFx17%
%John Erskine QUB 40257184%

function[k,s] = VelvetNoiseSampleGenerator(fs,p,Ls)
% fs:Sampling frequency (DAFx17 uses 44.1kHz)
% p:Density (DAFx17 uses 1000)
% Ls:Total lenght in samples

Td = fs/p;      %Average spacing between impulses
M = round(Ls/Td);      %Total number of samples
m = [1:M]';        %Impluse index vector

r1 = rand(M,1);           %Random numbers between 1 and 0
r2 = rand(M,1);           %Random numbers between 1 and 0

s = 2*round(r1)-1;          %Sign of each impulse
k = round(Td*m+r2*(Td-1));    %Location of the impulse
% Also given as k = round(Td*(m − 1 + r2)) in DAFx18 which gives a similar
% result
end
