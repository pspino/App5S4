%Main

close all;
clear all;
clc

[r,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

r = RII(r,Fe);
r = CoupeBandes(r,Fe);
audiowrite('Sons/Son_RII_CoupeBande_4_90.wav',r,Fe);