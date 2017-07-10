function r = RIF( s, N, n )
%RIFFUNCTION Summary of this function goes here
%   Detailed explanation goes here

b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         
a = [1 0.3696 0.04];

z = roots(a);
p = roots(b);

p = [.95*p(1); .95*p(2); 1/1.2^2*p(3); 1/1.2^2*p(4); 1/1.2^2*p(5); 1/1.2^2*p(6)];

h = abs(freqz(poly(z),poly(p),N));

H = ones(1,N);

for i = 1:n
    index = N/n;
    if i == 1
        index = index + 1;
        debut = 1;
        fin = index;
    elseif i == n
        index = index - 2;
        debut = N - index;
        fin = N;
    else
        debut = fin + 1;
        fin = fin + index;
    end
    H(debut:fin) = mean(h(debut:fin));
end

H = [H H(end) H(end:-1:2)];

h = ifftshift(ifft(H));

r = filter(h,1,s);

end

