close all;

% z = [exp(pi/16*i) exp(-pi/16*i)];
% p = 0.99*[exp(pi/16*i) exp(-pi/16*i)];
% a = poly(p);
% b = poly(z);
% 
% figure
% zplane(b,a);
% figure
% freqz(b,a);

% z = 0.9*[exp(pi/4*i) exp(-pi/4*i)];
% p = 0.99*[exp(pi/4*i) exp(-pi/4*i)];
% a = poly(p);
% b = poly(z)/10;
% 
% figure
% zplane(b,a);
% figure
% freqz(b,a);

z = 0.5*[exp(pi/4*i) exp(-pi/4*i)];
p = 0.6*[exp(pi/4*i) exp(-pi/4*i)];
a = poly(p);
b = poly(z)*2.5;

figure
zplane(b,a);
figure
freqz(b,a);
