close all;
clear all;

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');

peaks = abs(fft(s1,Fe));
id = Fe;

%pour mettre de 1 a Fe/2 seulement.
while id > Fe/2
    peaks(id)=[];
    id = id -1;
end

plot(peaks);
xpeak = [];
xpeak(end+1) = find(peaks==max(peaks(:)));
xpeak(end+1) = find(peaks==max(peaks(xpeak(1)+1:Fe/2)));        %Fait selon le Plot(peaks);

z = [exp(xpeak(1)*2*pi*i) exp(-xpeak(1)*2*pi*i)];
p = 0.99*[exp(xpeak(1)*2*pi*i) exp(-xpeak(1)*2*pi*i)];
a = poly(p);
b = poly(z);

figure
zplane(b,a);
