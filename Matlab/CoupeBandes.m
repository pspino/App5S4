% close all;
% clear all;
% 
% [s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
% [s2,Fe] = audioread('Sons/phrase_originale2.wav');

% peaks = abs(fft(s1,Fe));
% peaks = abs(fft(s1(end-1000:end)));
% peaks = abs(fft(s1(1:1000),Fe));

%pour mettre de 1 a Fe/2 seulement.
% while id > Fe/2
%     peaks(id)=[];
%     id = id -1;
% end

% stem(peaks);
% freq = [900 930 1300 1330];
function r = CoupeBandes(s1,Fe, freq)
    freq = [880 915 930 1280 1315 1330];
    z = [exp((freq(1)*2*pi)/Fe*i) exp((freq(2)*2*pi)/Fe*i) exp((freq(3)*2*pi)/Fe*i) exp((freq(4)*2*pi)/Fe*i) exp((freq(5)*2*pi)/Fe*i) exp((freq(6)*2*pi)/Fe*i)];
    z = [z, conj(z)];
    p = 0.975*z;
    a = poly(p);
    b = poly(z);
    r = filter(b,a,s1);
end