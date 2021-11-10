clc, close all, clear all
%load DataOne
load DataTwo

% Filters
f1 = [0 0 0; 0 -1 1; 0 0 0];
f2 = [0 0 0; 0 -1 0; 0 1 0];

f3 = [0 -1 0; -1 4 -1; 0 -1 0];
f4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
f5 = [1 -2 1; -1 4 -1; 0 -1 0];

% regulizer
FD1 = MyFFT2RI(f1, 256);
FD2 = MyFFT2RI(f2, 256);

FD3 = MyFFT2RI(f3, 256);
FD4 = MyFFT2RI(f4, 256);
FD5 = MyFFT2RI(f5, 256);

d0 = abs(FD3).^2 + abs(FD4).^2 + abs(FD5).^2;

% deconvolution
mu = 0;
deconv_res = deconv(Data, IR, d0, mu);
imagesc(deconv_res);
colormap('gray');colorbar
axis('square','off')
title("Deconvolution of Data 2, mu=0")


figure()
N = 256;
x_axis = linspace(-0.5,0.5,N);
y_axis = linspace(-0.5,0.5,N);
plot(TrueImage)
title("Plot of True Image")

