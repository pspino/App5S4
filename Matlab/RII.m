close all;
clear all;

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

%H(z) 
% b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];       %Coeff Nume
% a = [1 0.3696 0.04 ];                                 %Coeff Deno

%1/H(z)
b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         
a = [1 0.3696 0.04];

z = roots(a);
p = roots(b);

p = [.99*p(1); .99*p(2); 1/1.2^2*p(3); 1/1.2^2*p(4); 1/1.2^2*p(5); 1/1.2^2*p(6)];
figure
freqz(z,p);

b = poly(z);
a = poly(p);

figure
zplane(b,a);

r = filter(b,a,s1);
r = CoupeBandes(r,Fe);
figure
plot(r);
soundsc(r,Fe);