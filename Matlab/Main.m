%Main

close all;
clear all;
clc

[s1,Fe] = audioread('Sons/phrase_malentendant_bruite.wav');
[s2,Fe] = audioread('Sons/phrase_originale2.wav');

rif_4 = RIF(s1,256,4);
rif_4 = CoupeBandes(rif_4,Fe);
% audiowrite('Sons/Son_RIF_4_CoupeBande_4_90.wav',rif_4,Fe);

rif_8 = RIF(s1,256,8);
rif_8 = CoupeBandes(rif_8,Fe);
% audiowrite('Sons/Son_RIF_8_CoupeBande_4_90.wav',rif_8,Fe);

rif_16 = RIF(s1,256,16);
rif_16 = CoupeBandes(rif_16,Fe);
% audiowrite('Sons/Son_RIF_16_CoupeBande_4_90.wav',rif_16,Fe);

rii = RII(s1,Fe);
rii = CoupeBandes(s1,Fe);
audiowrite('Sons/Son_RII_CoupeBande_4_99.wav',rii,Fe);

%% SNR
[rsbrii ,trapzrii, simpsonrii] = RSB(s2,rii,Fe);
[rsbrif4,trapzrif4, simpsonrif4] = RSB(s2,rif_4,Fe);
[rsbrif8,trapzrif8, simpsonrif8]  = RSB(s2,rif_8,Fe);
[rsbrif16,trapzrif16, simpsonrif16]  = RSB(s2,rif_16,Fe);



