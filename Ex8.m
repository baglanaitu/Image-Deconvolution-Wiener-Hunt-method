clc, close all, clear all
load DataTwo
% Filters
f1 = [0 0 0; 0 -1 1; 0 0 0];
f2 = [0 0 0; 0 -1 0; 0 1 0];

f3 = [0 -1 0; -1 4 -1; 0 -1 0];
f4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
f5 = [1 -2 1; -1 4 -1; 0 -1 0];

% regulizer
N = 256;
FD1 = MyFFT2RI(f1, N);
FD2 = MyFFT2RI(f2, N);
d0 = abs(FD1).^2 + abs(FD2).^2;

%% Computation of distances
mu = 10^(-10);
out = "";

d1 = [];
d2 = [];
d3 = [];
mu_val = [];
for i=1:21
   deconvolved = deconv(Data, IR, d0, mu);
   dist1 = norm((deconvolved - TrueImage), 2)/norm(TrueImage,2);
   dist2 = norm((deconvolved - TrueImage), 1)/norm(TrueImage,1);
   dist3 = max(abs(deconvolved - TrueImage)) / max(abs(TrueImage));
   out = strcat(out, sprintf("Mu = %.1e, d1 = %.3f, d2 = %.3f, d3 = %.3f\n", [mu dist1 dist2 dist3]));
   mu=mu*10;
   
   d1(i) = dist1;
   d2(i) = dist2;
   d3(i) = dist3;
   mu_val(i) = mu;
end
out

% Plots
figure ()
plot(d1, "r", 'LineWidth',1.5)
hold on
plot(d2, "b", 'LineWidth',1.5)
hold on
plot(d3, "g", 'LineWidth',1.5)
ylabel("Distance values")
xlabel("Mu")
title("Distance functions")
%xticklabels({'10^(-10)','','','','','10^(-5)','','','','','1','','','','10^5','','','','','10^10'})
%xticklabels({'10^(-10)','10^(-9)','10^(-8)','10^(-7)','10^(-6)','10^(-5)','10^(-4)','10^(-3)','10^(-2)','10^(-1)','1','10','10^2','10^3','10^4','10^5','10^6','10^7','10^8','10^9','10^10'})
legend('d1','d2','d3')