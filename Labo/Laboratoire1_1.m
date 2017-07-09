close all;

t = (1:250)/250;
f = 0:12:125;

% H1 = z/(z - 0.7);
% H2 = z/(z + 0.7);
% H3 = z/(z + 0.9025);

figure
a = [1 -0.7];
b = 1;
maxima = zeros(1,length(f));
for i = 1:length(f)
    x = cos(2*pi*f(i)*t);
    maxima(i) = max(filter(b,a,x));
end
subplot(3,1,1);
stem(f,maxima);

a = [1 0.7];
b = 1;  
for i = 1:length(f)
    x = cos(2*pi*f(i)*t);
    maxima(i) = max(filter(b,a,x));
end
subplot(3,1,2);
stem(f,maxima);

a = [1 0 0.9025];
b = 1;
for i = 1:length(f)
    x = cos(2*pi*f(i)*t);
    maxima(i) = max(filter(b,a,x));
end
subplot(3,1,3);
stem(f,maxima);

figure
a = [1 -0.7];
b = 1;
freqz(b,a);

figure
a = [1 0.7];
b = 1;
freqz(b,a);

figure
a = [1 0 0.9025];
b = 1;
freqz(b,a);