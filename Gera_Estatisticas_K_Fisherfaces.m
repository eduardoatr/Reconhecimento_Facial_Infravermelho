%% ===================================================================================================================
%% Gera estatísticas para os resultados do Fisherfaces
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

% Adiciona os subdiretórios
addpath(genpath ('.'));

resK1V = 0;
resK2V = 0;
resK3V = 0;

resK1L = 0;
resK2L = 0;
resK3L = 0;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Fisherfaces_Twon_x_Dark');

k1V = 0;
k2V = 0;
k3V = 0;

k1L = 0;
k2L = 0;
k3L = 0;

for i=1:7
    k1V = k1V + resultadosFinais{i}.resultados(5,3);
    k2V = k2V + resultadosFinais{i}.resultados(10,3);
    k3V = k3V + resultadosFinais{i}.resultados(15,3);

    k1L = k1L + resultadosFinais{i}.resultados(5,4);
    k2L = k2L + resultadosFinais{i}.resultados(10,4);
    k3L = k3L + resultadosFinais{i}.resultados(15,4);
end

resK1V = resK1V  + k1V/7;
resK2V = resK2V  + k2V/7;
resK3V = resK3V  + k3V/7;

resK1L = resK1L + k1L/7;
resK2L = resK2L + k2L/7;
resK3L = resK3L + k3L/7;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Fisherfaces_Twon_x_Exp');

k1V = 0;
k2V = 0;
k3V = 0;

k1L = 0;
k2L = 0;
k3L = 0;

for i=1:7
    k1V = k1V + resultadosFinais{i}.resultados(5,3);
    k2V = k2V + resultadosFinais{i}.resultados(10,3);
    k3V = k3V + resultadosFinais{i}.resultados(15,3);

    k1L = k1L + resultadosFinais{i}.resultados(5,4);
    k2L = k2L + resultadosFinais{i}.resultados(10,4);
    k3L = k3L + resultadosFinais{i}.resultados(15,4);
end

resK1V = resK1V  + k1V/7;
resK2V = resK2V  + k2V/7;
resK3V = resK3V  + k3V/7;

resK1L = resK1L + k1L/7;
resK2L = resK2L + k2L/7;
resK3L = resK3L + k3L/7;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Fisherfaces_Twon_x_Lon');

k1V = 0;
k2V = 0;
k3V = 0;

k1L = 0;
k2L = 0;
k3L = 0;

for i=1:7
    k1V = k1V + resultadosFinais{i}.resultados(5,3);
    k2V = k2V + resultadosFinais{i}.resultados(10,3);
    k3V = k3V + resultadosFinais{i}.resultados(15,3);

    k1L = k1L + resultadosFinais{i}.resultados(5,4);
    k2L = k2L + resultadosFinais{i}.resultados(10,4);
    k3L = k3L + resultadosFinais{i}.resultados(15,4);
end

resK1V = resK1V  + k1V/7;
resK2V = resK2V  + k2V/7;
resK3V = resK3V  + k3V/7;

resK1L = resK1L + k1L/7;
resK2L = resK2L + k2L/7;
resK3L = resK3L + k3L/7;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Fisherfaces_Twon_x_Off');

k1V = 0;
k2V = 0;
k3V = 0;

k1L = 0;
k2L = 0;
k3L = 0;

for i=1:7
    k1V = k1V + resultadosFinais{i}.resultados(5,3);
    k2V = k2V + resultadosFinais{i}.resultados(10,3);
    k3V = k3V + resultadosFinais{i}.resultados(15,3);

    k1L = k1L + resultadosFinais{i}.resultados(5,4);
    k2L = k2L + resultadosFinais{i}.resultados(10,4);
    k3L = k3L + resultadosFinais{i}.resultados(15,4);
end

resK1V = resK1V  + k1V/7;
resK2V = resK2V  + k2V/7;
resK3V = resK3V  + k3V/7;

resK1L = resK1L + k1L/7;
resK2L = resK2L + k2L/7;
resK3L = resK3L + k3L/7;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Fisherfaces_Twon_x_Ron');

k1V = 0;
k2V = 0;
k3V = 0;

k1L = 0;
k2L = 0;
k3L = 0;

for i=1:7
    k1V = k1V + resultadosFinais{i}.resultados(5,3);
    k2V = k2V + resultadosFinais{i}.resultados(10,3);
    k3V = k3V + resultadosFinais{i}.resultados(15,3);

    k1L = k1L + resultadosFinais{i}.resultados(5,4);
    k2L = k2L + resultadosFinais{i}.resultados(10,4);
    k3L = k3L + resultadosFinais{i}.resultados(15,4);
end

resK1V = resK1V  + k1V/7;
resK2V = resK2V  + k2V/7;
resK3V = resK3V  + k3V/7;

resK1L = resK1L + k1L/7;
resK2L = resK2L + k2L/7;
resK3L = resK3L + k3L/7;

%% ===================================================================================================================
%%
%% ===================================================================================================================

resK1V = resK1V/5
resK2V = resK2V/5
resK3V = resK3V/5

resK1L = resK1L/5
resK2L = resK2L/5
resK3L = resK3L/5