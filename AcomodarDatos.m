%Edgar Moises Hernandez-Gonzalez
%25/07/20-28/01/21
%Acomodar los datos para que queden concatenados los canales
%Input Shape: (n_muestras*256)x4
%Output Shape: n_muestras*1024

clear
clc

load('MuBeta_ii_test.mat');
n_muestras = length(ondas_mi) / 256;
nuevo = zeros(n_muestras, 1024);
contador2 = 1;
for i=1:n_muestras
    contador1 = 1;
    for j=1:4
        nuevo(i, contador1:contador1+255)...
            = ondas_mi(contador2:contador2+255, j);
        contador1 = contador1 + 256;
    end
    contador2 = contador2 + 256;
end

csvwrite('MuBeta_EEG_ii_test.csv',nuevo);