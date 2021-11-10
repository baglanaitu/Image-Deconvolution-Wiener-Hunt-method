function out = deconv(Data, IR, d0, mu)
%{
FR = MyFFT2RI(IR, 256);
FTI = MyFFT2(Data);
inv = MyIFFT2(FTI./FR);
%}

% Output
h0 = MyFFT2RI(IR, 256);
y0 = MyFFT2(Data); 
inv = MyIFFT2(y0./h0);

% Wiener filter
WF = conj(h0) ./ (abs(h0).^2 + mu*d0);
deconv_res = MyIFFT2(WF.*y0);
out = deconv_res;
end

