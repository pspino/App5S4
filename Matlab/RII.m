close all;
clear all;

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

%H(z) 
% b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];       %Coeff Nume
% a = [1 0.3696 0.04 ];                                 %Coeff Deno

%1/H(z)
a = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         
b = [0 0 0 0 1 0.3696 0.04];                                    

z = roots(b);
p = roots(a);

zpt = poly(p);
z1 = z.^-1;
ppt = poly(0.1*z.^-1);

r = filter(zpt,ppt,s1);

% freqz(zpt,ppt);
% figure
% plot(r);
% soundsc(r);