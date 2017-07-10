%Main

close all;
clear all;
clc

[r,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

rif_4 = RIF(r,256,4);
rif_4 = CoupeBandes(rif_4,Fe);
audiowrite('Sons/Son_RIF_4_CoupeBande_4_90.wav',rif_4,Fe);

rif_8 = RIF(r,256,8);
rif_8 = CoupeBandes(rif_8,Fe);
audiowrite('Sons/Son_RIF_8_CoupeBande_4_90.wav',rif_8,Fe);

rif_16 = RIF(r,256,16);
rif_16 = CoupeBandes(rif_16,Fe);
audiowrite('Sons/Son_RIF_16_CoupeBande_4_90.wav',rif_16,Fe);

r = RII(r,Fe);
r = CoupeBandes(r,Fe);
audiowrite('Sons/Son_RII_CoupeBande_4_90.wav',r,Fe);