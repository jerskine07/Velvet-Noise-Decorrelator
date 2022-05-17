%Velvet noise decorrelator - Function reproducing figure 2 from DAFx17%
%John Erskine QUB 40257184%

function[k,se] = VelvetNoiseExponentialDecay(fs,p,Ls,LdB)
% fs:Sampling frequency (DAFx17 uses 44.1kHz)
% p:Density (DAFx17 uses 1000)
% Ls:Total lenght in samples
% LdB:Target total delay in dB

Td = fs/p;             %Average spacing between impulses
M = round(Ls/Td);      %Total number of samples
m = [1:M]';            %Impluse index vector

r1 = rand(M,1);           %Random numbers between 1 and 0
r2 = rand(M,1);           %Random numbers between 1 and 0

s = 2*round(r1)-1;            %Sign of each impulse
k = round(Td*m+r2*(Td-1));    %Location of the impulse

L = 10^(LdB/20);                        %Target total delay converted
dc = (-log10(10^(-LdB/20))) / (M);      %Decay constant, often referred to as alpha
D = exp(-dc*m);                         %Decay envelope
                                                      
se = s.*D;         %New impluse with envelope applied
end
