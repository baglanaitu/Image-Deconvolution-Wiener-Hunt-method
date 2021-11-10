clc, close all, clear all
%load DataOne
load DataTwo

N = 256;
x_axis = linspace(-0.5,0.5,N);
y_axis = linspace(-0.5,0.5,N);

% Filters
f1 = [0 0 0; 0 -1 1; 0 0 0];
f2 = [0 0 0; 0 -1 0; 0 1 0];

f3 = [0 -1 0; -1 4 -1; 0 -1 0];
f4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
f5 = [1 -2 1; -1 4 -1; 0 -1 0];

% regulizer
FD1 = MyFFT2RI(f1, N);
FD2 = MyFFT2RI(f2, N);
d0 = abs(FD1).^2 + abs(FD2).^2;

%% deconvolution
mu = 10;
deconv_res = deconv(Data, IR, d0, mu);

% Spatial domain
imagesc(deconv_res);
colormap('gray');colorbar
axis('square','off')
title("Deconvolution of Data 2, mu=10")

% Frequency domain
figure ()
imagesc(x_axis, y_axis, log(abs(MyFFT2(deconv_res))))
colormap('gray');colorbar
axis('square','off')
title("Deconvolution of Data 2, mu=10")


