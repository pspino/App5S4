close all;
clear all;

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');
[s3,Fe] = audioread('Sons/cordes_16k.wav');

%H(z) 
% z = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];       %Coeff Nume
% p = [1 0.3696 0.04 ];                                 %Coeff Deno

%1/H(z)
p = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         %Coeff Nume
z = [1 0.3696 0.04];                                    %Coeff Denos

pp = poly(z);
root = roots(pp);

ppt = [1 -27.71 67.75];
zpt = [0 0 0 0 1 -0.4096 0.0148];

b = p.*zpt;
a = z.*ppt;
    
r = filter(b,a,s1);
zplane(b,a);
figure
freqz(b,a);
soundsc(r);