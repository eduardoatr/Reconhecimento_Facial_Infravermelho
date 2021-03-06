%% ===================================================================================================================
%% Gera estatísticas para os resultados do Eigenfaces
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

x = 6;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Dark');

resultadosFinais{x}.distancia
resultadosFinais{x}.resultados

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Exp');

resultadosFinais{x}.distancia
resultadosFinais{x}.resultados

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Lon');

resultadosFinais{x}.distancia
resultadosFinais{x}.resultados

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Off');

resultadosFinais{x}.distancia
resultadosFinais{x}.resultados

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Ron');

resultadosFinais{x}.distancia
resultadosFinais{x}.resultados
