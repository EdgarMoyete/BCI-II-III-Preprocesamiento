%Edgar Moises Hernandez-Gonzalez
%24/07/20
%Etiquetas

clear
clc

load('dataset_BCIcomp1.mat');
etiquetas_train = y_train - 1;

load('labels_data_set_iii.mat');
etiquetas_test = y_test - 1;

csvwrite('etiquetas_train.csv', etiquetas_train);
csvwrite('etiquetas_test.csv', etiquetas_test);