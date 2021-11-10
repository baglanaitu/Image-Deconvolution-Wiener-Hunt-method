clc, close all, clear all
%load DataOne
load DataTwo
%% Frequency domain
N = 256;
x_axis = linspace(-0.5,0.5,N);
y_axis = linspace(-0.5,0.5,N);
img = TrueImage;

%% Linear scale
PSD_lin = abs(MyFFT2(img)); 
imagesc(x_axis, y_axis,PSD_lin);
colormap('gray'); colorbar
axis('square', 'on')
title('Freq. domain: True image in linear scale')

%% Logarithmic scale
PSD_log = 10*log10(abs(fftshift(fft2(img))).^2 ); 

figure(4); clf
imagesc(x_axis, y_axis, PSD_log);
colormap('gray');
colorbar
title("Freq. domain: True image in log scale")














