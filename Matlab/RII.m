%H(z) 
% b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];       %Coeff Nume
% a = [1 0.3696 0.04 ];                                 %Coeff Deno

function r = RII(s1,Fe)
    %1/H(z)
    b = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074];         
    a = [1 0.3696 0.04];
    z = roots(a);
    p = roots(b);
    p = [.95*p(1); .95*p(2); 1/p(3); 1/p(4); 1/p(5); 1/p(6)];
    b = poly(z);
    a = poly(p);
    r = filter(b,a,s1);
end

