%% ===================================================================================================================
%% Pré computação dos conjuntos de treino para cada tipo de imagem
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

% Adiciona os subdiretórios
addpath(genpath ('.'));

% Contadores para o tempo
inicio = 0;  % marcador de início da contagem
fim = 0;     % marcador de fim da contagem

% Caminho do banco
caminho = './Databases/IRIS_Thermal_Visible_Face_Database';

% Mensagem início do treimamento
fprintf(1,'\n>>> Iniciando o treinamento <<<\n')

% =====================================================================================================
% Tudo escuro
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Dark <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = false;   	% duas luzes acesas
dark = true;   		% foto escura
lon = false;   		% luz esquerda acessa
off = false;    	% duas luzes apagadas
ron = false;    	% luz direita acesa
iluminacao = [true,twon,dark,lon,off,ron];
expressao = false;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Dark.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Dark finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Duas Luzes Apagadas
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Off <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = false;		% duas luzes acesas
dark = false;   	% foto escura
lon = false;    	% luz esquerda acessa
off = true;    		% duas luzes apagadas
ron = false;    	% luz direita acesa
iluminacao = [true,twon,dark,lon,off,ron];
expressao = false;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Off.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Off finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Duas Luzes Acesas
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Twon <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = true;		% duas luzes acesas
dark = false;   	% foto escura
lon = false;    	% luz esquerda acessa
off = false;    	% duas luzes apagadas
ron = false;    	% luz direita acesa
iluminacao = [true,twon,dark,lon,off,ron];
expressao = false;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Twon.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Twon finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Luz Esquerda
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Lon <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = false;   	% duas luzes acesas
dark = false;  		% foto escura
lon = true;    		% luz esquerda acessa
off = false;   		% duas luzes apagadas
ron = false;    	% luz direita acesa
iluminacao = [true,twon,dark,lon,off,ron];
expressao = false;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Lon.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Lon finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Luz Direita
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Ron <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = false;   	% duas luzes acesas
dark = false;   	% foto escura
lon = false;    	% luz esquerda acessa
off = false;    	% duas luzes apagadas
ron = true;    		% luz direita acesa
iluminacao = [true,twon,dark,lon,off,ron];
expressao = false;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Ron.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Ron finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Expressoes
% =====================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Gerando conjunto de treino para: Exp <<<\n')

% Guarda o tempo de início
inicio = cputime;

% Variáveis para cada tipo de imagem
twon = false;   	% duas luzes acesas
dark = false;   	% foto escura
lon = false;    	% luz esquerda acessa
off = false;    	% duas luzes apagadas
ron = false;    	% luz direita acesa
iluminacao = [false,twon,dark,lon,off,ron];
expressao = true;

% Lê as imagens
[treinoV treinoL  classesV classesL  largura  altura  nomes] = lerImgs(caminho,expressao,iluminacao);

% Salva matrizes
save('./Matrizes/Treino_Exp.mat','treinoV','treinoL','classesV', 'classesL', 'largura', 'altura', 'nomes');

% Calcula o tempo gasto
fim = cputime-inicio;

% Mensagem de fim
fprintf(1,'\n>>> Exp finalizado em: %f segundos <<<\n',fim)

% =====================================================================================================
% Fim do treinamento
% =====================================================================================================

% Mensagem de fim do treinamento
fprintf(1,'\n>>> Treinamento finalizado <<<\n')
