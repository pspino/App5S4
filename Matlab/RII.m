close all;
clear all;

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

%H(z) 
% b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];       %Coeff Nume
% a = [1 0.3696 0.04 ];                                 %Coeff Deno

%1/H(z)
a = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         
b = [1 0.3696 0.04];

z = roots(b);
p = roots(a);

zplane(z,p);

p = [.99*p(1); .99*p(2); 1/p(3); 1/p(4) ;1/p(5); 1/p(6)];
figure
zplane(z,p);

a = poly(z);
b = poly(p);

r = filter(b,a,s1);
figure
plot(r);
soundsc(r);