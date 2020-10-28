%Edgar Moises Hernandez-Gonzalez
%24/07/20
%CAR (common average reference)
%Input Shape: (n_muestra*768)x3
%Output Shape: (n_muestra*768)x3
%canal C4 es el 3
%muestra 2 es derecha para train

clear
clc

load('MI_test.mat');
promedio = mean(signals, 2);
car = signals - promedio;

save('Car_test.mat','car');

% % Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = signals(769:1536,3);
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(769:1536,3);
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off