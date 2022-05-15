%% ===================================================================================================================
%% Teste do Fisherfaces para uma única imagem
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

% Adiciona os subdiretórios
addpath(genpath ('.'));

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Dark.mat';

% Contadores para o tempo
inicio = 0;  % marcador de início da contagem
fim = 0;     % marcador de fim da contagem

% Variáveis do reconhecimento
k = 1; % valor de k para o k-NN
distancia = 1; % euclidiana = 1 | manhatthan = 2 | chebyshev = 3 | cosseno = 4 | mahalanobis = 5 | minkowski = 6 | correlação = 7
distancias = {'Euclidiana','Manhattan','Chebyshev', 'Cosseno', 'Mahalanobis', 'Minkowski', 'Correlação'}; % para printar os nomes

% Mensagem início do reconhecimento
fprintf(1,'\n>>> Iniciando o reconhecimento <<<\n')
fprintf(1,'\n>>> Distância: %s | Valor de k: %d <<<\n',distancias{distancia},k);

% =====================================================================================================
% Início do reconhecimento
% =====================================================================================================

inicio = cputime;

% ===================================================================================================================
% Separada imagem e classe de teste
% ===================================================================================================================

% Carrega a matriz de teste pré-computada
load(caminhoTeste)

% Checa número de imagens
n = size(treinoV,2);

% Sorteia um número aleatório para selecionar uma imagem
% num = uint32(rand()*n);
num = 239;

% Gera o set de teste para imagem do espectro visível
imgTesteV = treinoV(:,num);
classeTesteV = classesV(num);

% Gera o set de teste para imagem infravermelha
imgTesteL = treinoL(:,num);
classeTesteL = classesL(num);

% Guarda nomes
nomesClasses = nomes;

% ===================================================================================================================
% Separada imagem e classe de treino
% ===================================================================================================================

% Carrega a matriz de treino pré-computada
load(caminhoTreino)

% Executa o eigenfaces no conjunto visível
resV = fisherfaces(treinoV,classesV);

% Executa o eigenfaces no conjunto infravermelho
resL = fisherfaces(treinoL,classesL);

% Mostra as fisherfaces para o conjunto visível
figure('Name','Fisherfaces - Visível');
title('FISHERFACES');
for i=1:min(20, size(resV.CP,2))
    subplot(4,5,i);
    temp = converterImg(resV.CP(:,i), largura, altura);
    imshow(temp);
end

% Mostra as fisherfaces para o conjunto infravermelho
figure('Name','Fisherfaces - Infravermelho');
title('FISHERFACES');
for i=1:min(20, size(resL.CP,2))
    subplot(4,5,i);
    temp = converterImg(resL.CP(:,i), largura, altura);
    imshow(temp);
end

% Faz o reconhecimento da imagem visível
recV = fisherfacesRec(resV, imgTesteV, distancia, k, true);

% Faz o reconhecimento da imagem infravermelha
recL = fisherfacesRec(resL, imgTesteL, distancia, k, true);

% Mostra resultado visível
figure('Name','Resultado - Visível');
title ('Resultado');
subplot (1, 2, 1);
temp = converterImg(imgTesteV, largura, altura);
imshow(temp);
title(sprintf('FACE-TESTE'));
subplot (1, 2, 2);
imagens = find(classesV==recV);
indice = imagens(:,ceil(end/2));
temp = converterImg(treinoV(:,indice), largura, altura);
imshow(temp);
title(sprintf('FACE-RECONHECIDA'));

% Imprime o resultado visível
fprintf(1,'\n>>> Visível: Classe Teste: %d | Classe reconhecida: %d <<<\n',classeTesteV,recV)

% Mostra resultado infravermelho
figure('Name','Resultado - Infravermelho');
title ('Resultado');
subplot (1, 2, 1);
temp = converterImg(imgTesteL, largura, altura);
imshow(temp);
title(sprintf('FACE-TESTE'));
subplot (1, 2, 2);
imagens = find(classesL==recL);

% Seleciona uma imagem do meio (frontal) para representar o dindivíduo
indice = imagens(:,ceil(end/2));

temp = converterImg(treinoL(:,indice), largura, altura);
imshow(temp);
title(sprintf('FACE-RECONHECIDA'));

% Imprime o resultado visível
fprintf(1,'\n>>> Infravermelho: Classe Teste: %d | Classe reconhecida: %d <<<\n',classeTesteL,recL)

% =====================================================================================================
% Fim do reconhecimento
% =====================================================================================================

fim = cputime-inicio;

% Mensagem de fim do reconhecimento
fprintf(1,'\n>>> Reconhecimento finalizado em: %f segundos <<<\n',fim)
