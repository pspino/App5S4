close all;

K = 1;
z1 = 0.8i;
z2 = -0.8i;
p1 = 0.95*exp(1i*pi/8);
p2 = 0.95*exp(1i*-pi/8);

% Hz = K(((z-z1)*(z-z2))/((z-p1)*(z-p2)));

figure
z = [z1; z2];
p = [p1; p2];
zplane(z,p);

figure
b = poly(z);
a = poly(p);
freqz(b,a);


figure
x = randn(1,8000);
y = filter(b,a,x);
subplot(2,1,1);
plot(x);
subplot(2,1,2);
ffty = stem(abs(fft(y,8000))/8000);



figure
impulse = zeros(1,500);
impulse(250) = 1;
subplot(2,1,1);
y = filter(b,a,impulse);
plot(y);
subplot(2,1,2);
ffty = abs(fft(y));
stem(ffty);

figure
y = filter(a,b,y);
plot(y);
