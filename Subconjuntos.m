%Edgar Moises Hernandez-Gonzalez
%24/07/20
%Subconjuntos de BCI-II-III
%Obtenemos los 6 seg de MI del segundo 3 al 9
%Fs=128Hz, por lo tanto en 6 seg son 768 datos
%Input Shape: 1152x3x140 = (9x128)x3x140 [(seg x fs) x n canales x n muestras]
%Output Shape: 107520 x 3 = (140x6x128)x3 [(n muestras x seg x fs) x n canales]

clear
clc

load('dataset_BCIcomp1.mat');
forma = size(x_train);
n_muestras = forma(3);
signals = zeros(n_muestras*6*128, 3);
contador = 1;
for i=1:n_muestras
    %s(3seg : 9seg, numCanal)
    signals(contador:contador+767, 1:3) = x_test(385:1152,:,i);
	contador = contador + 768;
end
save('MI_test.mat','signals');