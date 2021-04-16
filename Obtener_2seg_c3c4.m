%Edgar Moises Hernandez-Gonzalez
%28/01/21
%Obtener 2 segundos de C3 y C4
%BCI IV-2b (fs=250Hz): canales: 1 y 3, segundo: 0.5s a 2.5s
%BCI II-III (fs=128Hz): canales: 1 y 3, segundo: 3.5s a 5.5s

clear
clc

load('Car_test.mat');

c3_c4 = [car(:,1) car(:,3)]; % C3 y C4, canal 1 y canal 3
n_ejemplos = length(c3_c4)/768;
c3_c4_seg = zeros(n_ejemplos*256, 2); % matriz para guardas 2 seg de c3 y c4
contador = 1;
contador_nuevo = 1;
for i=1:n_ejemplos
    c3_c4_seg(contador_nuevo:contador_nuevo+255,:) =...
        c3_c4(contador+448:contador+703, :);
    contador_nuevo = contador_nuevo + 256; % 256 por que son 2 segundos a 128 Hz
    contador = contador + 768; % 768 por que son 6 segundos a 128 Hz
end

%calcular mu y beta con pasa banda
fs = 128;
mu = bandpass(c3_c4_seg, [8 13], fs); % mu 8-13Hz
beta = bandpass(c3_c4_seg, [13 30], fs); % beta 13-30Hz

ondas_mi = [mu beta]; %unir o concatenar matrices de mu y beta


p = zeros(n_ejemplos, 4);
j = 1;
for i=1:n_ejemplos
    p(i,:) = bandpower(ondas_mi(j:j+255,:));
    j = j + 256; % 256 por que son 2 segundos a 128 Hz
end

save('MuBeta_ii_test.mat','ondas_mi');
csvwrite('BP_ii_test.csv',p); % guardar en .csv