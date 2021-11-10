clc, close all, clear all
%load DataOne
load DataTwo

N = 256;
x_axis = linspace(-0.5,0.5,N);
y_axis = linspace(-0.5,0.5,N);
%{
%% Transfer function
transfer_IR = MyFFT2RI(IR, 256);
imshow(transfer_IR)
colormap('gray')


FR = MyFFT2RI(IR, 256);
FTI = MyFFT2(Data);
inv = MyIFFT2(FTI./FR);
imshow(inv)
colormap('gray'); colorbar
axis('square','off')
%}

%% IR: imagesc
figure ()
imagesc(IR)
colormap('gray'); colorbar
title("Data 2: impulse responce by 'imagesc' function")

%% IR: plot
figure ()
plot(IR)
title("Data 2: impulse responce by 'plot' function")

%% Transfer func.
% plot
figure ()
transfer_IR = abs(MyFFT2RI(IR, N));
imagesc(x_axis, y_axis, transfer_IR)
colormap('gray')
title("Data 2: plot, transfer function")

% imagesc
figure ()
transfer_IR = abs(MyFFT2RI(IR, N));
plot(x_axis, transfer_IR)
colormap('gray')
title("Data 2: imagesc, transfer function")