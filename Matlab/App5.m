[s1,Fe] = audioread('Sons/cordes_16k.wav');
[s2,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s3,Fe] = audioread('Sons/phrase_originale2.wav');

a = [1 -3.914 7.643 -9.551 8.717 -5.637 2.074]; %Coeff Nume
b = [1 0.3696 0.04];                            %Coeff Deno