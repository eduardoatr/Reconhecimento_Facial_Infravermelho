%% ===================================================================================================================
%% Gera estatísticas para os resultados do Eigenfaces
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

% Adiciona os subdiretórios
addpath(genpath ('.'));

resComponentes10V = 0;
resComponentes20V = 0;
resComponentes30V = 0;
resComponentes40V = 0;
resComponentes50V = 0;

resComponentes10L = 0;
resComponentes20L = 0;
resComponentes30L = 0;
resComponentes40L = 0;
resComponentes50L = 0;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Dark');

componentes10V = 0;
componentes20V = 0;
componentes30V = 0;
componentes40V = 0;
componentes50V = 0;

componentes10L = 0;
componentes20L = 0;
componentes30L = 0;
componentes40L = 0;
componentes50L = 0;

for i=1:7
    componentes10V = componentes10V+resultadosFinais{i}.resultados(1,3)+resultadosFinais{i}.resultados(6,3)+resultadosFinais{i}.resultados(11,3);
    componentes20V = componentes20V+resultadosFinais{i}.resultados(2,3)+resultadosFinais{i}.resultados(7,3)+resultadosFinais{i}.resultados(12,3);
    componentes30V = componentes30V+resultadosFinais{i}.resultados(3,3)+resultadosFinais{i}.resultados(8,3)+resultadosFinais{i}.resultados(13,3);
    componentes40V = componentes40V+resultadosFinais{i}.resultados(4,3)+resultadosFinais{i}.resultados(9,3)+resultadosFinais{i}.resultados(14,3);
    componentes50V = componentes50V+resultadosFinais{i}.resultados(5,3)+resultadosFinais{i}.resultados(10,3)+resultadosFinais{i}.resultados(15,3);

    componentes10L = componentes10L+resultadosFinais{i}.resultados(1,4)+resultadosFinais{i}.resultados(6,4)+resultadosFinais{i}.resultados(11,4);
    componentes20L = componentes20L+resultadosFinais{i}.resultados(2,4)+resultadosFinais{i}.resultados(7,4)+resultadosFinais{i}.resultados(12,4);
    componentes30L = componentes30L+resultadosFinais{i}.resultados(3,4)+resultadosFinais{i}.resultados(8,4)+resultadosFinais{i}.resultados(13,4);
    componentes40L = componentes40L+resultadosFinais{i}.resultados(4,4)+resultadosFinais{i}.resultados(9,4)+resultadosFinais{i}.resultados(14,4);
    componentes50L = componentes50L+resultadosFinais{i}.resultados(5,4)+resultadosFinais{i}.resultados(10,4)+resultadosFinais{i}.resultados(15,4);
end

resComponentes10V = resComponentes10V + componentes10V/21;
resComponentes20V = resComponentes20V + componentes20V/21;
resComponentes30V = resComponentes30V + componentes30V/21;
resComponentes40V = resComponentes40V + componentes40V/21;
resComponentes50V = resComponentes50V + componentes50V/21;

resComponentes10L = resComponentes10L + componentes10L/21;
resComponentes20L = resComponentes20L + componentes20L/21;
resComponentes30L = resComponentes30L + componentes30L/21;
resComponentes40L = resComponentes40L + componentes40L/21;
resComponentes50L = resComponentes50L + componentes50L/21;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Exp');

componentes10V = 0;
componentes20V = 0;
componentes30V = 0;
componentes40V = 0;
componentes50V = 0;

componentes10L = 0;
componentes20L = 0;
componentes30L = 0;
componentes40L = 0;
componentes50L = 0;

for i=1:7
    componentes10V = componentes10V+resultadosFinais{i}.resultados(1,3)+resultadosFinais{i}.resultados(6,3)+resultadosFinais{i}.resultados(11,3);
    componentes20V = componentes20V+resultadosFinais{i}.resultados(2,3)+resultadosFinais{i}.resultados(7,3)+resultadosFinais{i}.resultados(12,3);
    componentes30V = componentes30V+resultadosFinais{i}.resultados(3,3)+resultadosFinais{i}.resultados(8,3)+resultadosFinais{i}.resultados(13,3);
    componentes40V = componentes40V+resultadosFinais{i}.resultados(4,3)+resultadosFinais{i}.resultados(9,3)+resultadosFinais{i}.resultados(14,3);
    componentes50V = componentes50V+resultadosFinais{i}.resultados(5,3)+resultadosFinais{i}.resultados(10,3)+resultadosFinais{i}.resultados(15,3);

    componentes10L = componentes10L+resultadosFinais{i}.resultados(1,4)+resultadosFinais{i}.resultados(6,4)+resultadosFinais{i}.resultados(11,4);
    componentes20L = componentes20L+resultadosFinais{i}.resultados(2,4)+resultadosFinais{i}.resultados(7,4)+resultadosFinais{i}.resultados(12,4);
    componentes30L = componentes30L+resultadosFinais{i}.resultados(3,4)+resultadosFinais{i}.resultados(8,4)+resultadosFinais{i}.resultados(13,4);
    componentes40L = componentes40L+resultadosFinais{i}.resultados(4,4)+resultadosFinais{i}.resultados(9,4)+resultadosFinais{i}.resultados(14,4);
    componentes50L = componentes50L+resultadosFinais{i}.resultados(5,4)+resultadosFinais{i}.resultados(10,4)+resultadosFinais{i}.resultados(15,4);
end

resComponentes10V = resComponentes10V + componentes10V/21;
resComponentes20V = resComponentes20V + componentes20V/21;
resComponentes30V = resComponentes30V + componentes30V/21;
resComponentes40V = resComponentes40V + componentes40V/21;
resComponentes50V = resComponentes50V + componentes50V/21;

resComponentes10L = resComponentes10L + componentes10L/21;
resComponentes20L = resComponentes20L + componentes20L/21;
resComponentes30L = resComponentes30L + componentes30L/21;
resComponentes40L = resComponentes40L + componentes40L/21;
resComponentes50L = resComponentes50L + componentes50L/21;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Lon');

componentes10V = 0;
componentes20V = 0;
componentes30V = 0;
componentes40V = 0;
componentes50V = 0;

componentes10L = 0;
componentes20L = 0;
componentes30L = 0;
componentes40L = 0;
componentes50L = 0;

for i=1:7
    componentes10V = componentes10V+resultadosFinais{i}.resultados(1,3)+resultadosFinais{i}.resultados(6,3)+resultadosFinais{i}.resultados(11,3);
    componentes20V = componentes20V+resultadosFinais{i}.resultados(2,3)+resultadosFinais{i}.resultados(7,3)+resultadosFinais{i}.resultados(12,3);
    componentes30V = componentes30V+resultadosFinais{i}.resultados(3,3)+resultadosFinais{i}.resultados(8,3)+resultadosFinais{i}.resultados(13,3);
    componentes40V = componentes40V+resultadosFinais{i}.resultados(4,3)+resultadosFinais{i}.resultados(9,3)+resultadosFinais{i}.resultados(14,3);
    componentes50V = componentes50V+resultadosFinais{i}.resultados(5,3)+resultadosFinais{i}.resultados(10,3)+resultadosFinais{i}.resultados(15,3);

    componentes10L = componentes10L+resultadosFinais{i}.resultados(1,4)+resultadosFinais{i}.resultados(6,4)+resultadosFinais{i}.resultados(11,4);
    componentes20L = componentes20L+resultadosFinais{i}.resultados(2,4)+resultadosFinais{i}.resultados(7,4)+resultadosFinais{i}.resultados(12,4);
    componentes30L = componentes30L+resultadosFinais{i}.resultados(3,4)+resultadosFinais{i}.resultados(8,4)+resultadosFinais{i}.resultados(13,4);
    componentes40L = componentes40L+resultadosFinais{i}.resultados(4,4)+resultadosFinais{i}.resultados(9,4)+resultadosFinais{i}.resultados(14,4);
    componentes50L = componentes50L+resultadosFinais{i}.resultados(5,4)+resultadosFinais{i}.resultados(10,4)+resultadosFinais{i}.resultados(15,4);
end

resComponentes10V = resComponentes10V + componentes10V/21;
resComponentes20V = resComponentes20V + componentes20V/21;
resComponentes30V = resComponentes30V + componentes30V/21;
resComponentes40V = resComponentes40V + componentes40V/21;
resComponentes50V = resComponentes50V + componentes50V/21;

resComponentes10L = resComponentes10L + componentes10L/21;
resComponentes20L = resComponentes20L + componentes20L/21;
resComponentes30L = resComponentes30L + componentes30L/21;
resComponentes40L = resComponentes40L + componentes40L/21;
resComponentes50L = resComponentes50L + componentes50L/21;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Off');

componentes10V = 0;
componentes20V = 0;
componentes30V = 0;
componentes40V = 0;
componentes50V = 0;

componentes10L = 0;
componentes20L = 0;
componentes30L = 0;
componentes40L = 0;
componentes50L = 0;

for i=1:7
    componentes10V = componentes10V+resultadosFinais{i}.resultados(1,3)+resultadosFinais{i}.resultados(6,3)+resultadosFinais{i}.resultados(11,3);
    componentes20V = componentes20V+resultadosFinais{i}.resultados(2,3)+resultadosFinais{i}.resultados(7,3)+resultadosFinais{i}.resultados(12,3);
    componentes30V = componentes30V+resultadosFinais{i}.resultados(3,3)+resultadosFinais{i}.resultados(8,3)+resultadosFinais{i}.resultados(13,3);
    componentes40V = componentes40V+resultadosFinais{i}.resultados(4,3)+resultadosFinais{i}.resultados(9,3)+resultadosFinais{i}.resultados(14,3);
    componentes50V = componentes50V+resultadosFinais{i}.resultados(5,3)+resultadosFinais{i}.resultados(10,3)+resultadosFinais{i}.resultados(15,3);

    componentes10L = componentes10L+resultadosFinais{i}.resultados(1,4)+resultadosFinais{i}.resultados(6,4)+resultadosFinais{i}.resultados(11,4);
    componentes20L = componentes20L+resultadosFinais{i}.resultados(2,4)+resultadosFinais{i}.resultados(7,4)+resultadosFinais{i}.resultados(12,4);
    componentes30L = componentes30L+resultadosFinais{i}.resultados(3,4)+resultadosFinais{i}.resultados(8,4)+resultadosFinais{i}.resultados(13,4);
    componentes40L = componentes40L+resultadosFinais{i}.resultados(4,4)+resultadosFinais{i}.resultados(9,4)+resultadosFinais{i}.resultados(14,4);
    componentes50L = componentes50L+resultadosFinais{i}.resultados(5,4)+resultadosFinais{i}.resultados(10,4)+resultadosFinais{i}.resultados(15,4);
end

resComponentes10V = resComponentes10V + componentes10V/21;
resComponentes20V = resComponentes20V + componentes20V/21;
resComponentes30V = resComponentes30V + componentes30V/21;
resComponentes40V = resComponentes40V + componentes40V/21;
resComponentes50V = resComponentes50V + componentes50V/21;

resComponentes10L = resComponentes10L + componentes10L/21;
resComponentes20L = resComponentes20L + componentes20L/21;
resComponentes30L = resComponentes30L + componentes30L/21;
resComponentes40L = resComponentes40L + componentes40L/21;
resComponentes50L = resComponentes50L + componentes50L/21;

%% ===================================================================================================================
%%
%% ===================================================================================================================

load('./Resultados/Resultado_Eigenfaces_Twon_x_Ron');

componentes10V = 0;
componentes20V = 0;
componentes30V = 0;
componentes40V = 0;
componentes50V = 0;

componentes10L = 0;
componentes20L = 0;
componentes30L = 0;
componentes40L = 0;
componentes50L = 0;

for i=1:7
    componentes10V = componentes10V+resultadosFinais{i}.resultados(1,3)+resultadosFinais{i}.resultados(6,3)+resultadosFinais{i}.resultados(11,3);
    componentes20V = componentes20V+resultadosFinais{i}.resultados(2,3)+resultadosFinais{i}.resultados(7,3)+resultadosFinais{i}.resultados(12,3);
    componentes30V = componentes30V+resultadosFinais{i}.resultados(3,3)+resultadosFinais{i}.resultados(8,3)+resultadosFinais{i}.resultados(13,3);
    componentes40V = componentes40V+resultadosFinais{i}.resultados(4,3)+resultadosFinais{i}.resultados(9,3)+resultadosFinais{i}.resultados(14,3);
    componentes50V = componentes50V+resultadosFinais{i}.resultados(5,3)+resultadosFinais{i}.resultados(10,3)+resultadosFinais{i}.resultados(15,3);

    componentes10L = componentes10L+resultadosFinais{i}.resultados(1,4)+resultadosFinais{i}.resultados(6,4)+resultadosFinais{i}.resultados(11,4);
    componentes20L = componentes20L+resultadosFinais{i}.resultados(2,4)+resultadosFinais{i}.resultados(7,4)+resultadosFinais{i}.resultados(12,4);
    componentes30L = componentes30L+resultadosFinais{i}.resultados(3,4)+resultadosFinais{i}.resultados(8,4)+resultadosFinais{i}.resultados(13,4);
    componentes40L = componentes40L+resultadosFinais{i}.resultados(4,4)+resultadosFinais{i}.resultados(9,4)+resultadosFinais{i}.resultados(14,4);
    componentes50L = componentes50L+resultadosFinais{i}.resultados(5,4)+resultadosFinais{i}.resultados(10,4)+resultadosFinais{i}.resultados(15,4);
end

resComponentes10V = resComponentes10V + componentes10V/21;
resComponentes20V = resComponentes20V + componentes20V/21;
resComponentes30V = resComponentes30V + componentes30V/21;
resComponentes40V = resComponentes40V + componentes40V/21;
resComponentes50V = resComponentes50V + componentes50V/21;

resComponentes10L = resComponentes10L + componentes10L/21;
resComponentes20L = resComponentes20L + componentes20L/21;
resComponentes30L = resComponentes30L + componentes30L/21;
resComponentes40L = resComponentes40L + componentes40L/21;
resComponentes50L = resComponentes50L + componentes50L/21;

%% ===================================================================================================================
%%
%% ===================================================================================================================

resComponentes10V = resComponentes10V/5
resComponentes20V = resComponentes20V/5
resComponentes30V = resComponentes30V/5
resComponentes40V = resComponentes40V/5
resComponentes50V = resComponentes50V/5

resComponentes10L = resComponentes10L/5
resComponentes20L = resComponentes20L/5
resComponentes30L = resComponentes30L/5
resComponentes40L = resComponentes40L/5
resComponentes50L = resComponentes50L/5