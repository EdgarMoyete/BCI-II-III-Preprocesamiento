%Edgar Moises Hernandez-Gonzalez
%25/07/20
%Acomodar los datos para que queden concatenados los canales
%Input Shape: (n_muestras*768)x3
%Output Shape: n_muestras*2304

clear
clc

load('Filtradas_test.mat');
n_muestras = length(signals_filtradas) / 768;
nuevo = zeros(n_muestras, 2304);
contador2 = 1;
for i=1:n_muestras
    contador1 = 1;
    for j=1:3
        nuevo(i, contador1:contador1+767)...
            = signals_filtradas(contador2:contador2+767, j);
        contador1 = contador1 + 768;
    end
    contador2 = contador2 + 768;
end

csvwrite('MIEEG_test.csv',nuevo);