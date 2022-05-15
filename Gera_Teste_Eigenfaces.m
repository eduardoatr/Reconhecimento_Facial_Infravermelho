%% ===================================================================================================================
%% Teste do Eigenfaces para um conjunto de imagens
%% ===================================================================================================================

% Limpa o workspace e o console
clear all
clc

% Adiciona os subdiretórios
addpath(genpath ('.'));

% Contadores para o tempo
inicio = 0;  % marcador de início da contagem
fim = 0;     % marcador de fim da contagem
inicioDistancias = 0;  % marcador de início da contagem das distâncias
fimDistancias = 0;     % marcador de fim da contagem distâncias

% Mensagem início do reconhecimento
fprintf(1,'\n>>> Iniciando o reconhecimento <<<\n')

% ===================================================================================================================
% Início do reconhecimento
% ===================================================================================================================

inicio = cputime;

% ===================================================================================================================
% Twon X Dark
% ===================================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Realizando o reconhecimento <<<\n>>> Treino: Twon | Teste: Dark <<<\n')

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Dark.mat';

% Matriz para guardar os resultados finais
resultadosFinais = {};

% ===================================================================================================================
% Carrega os dados de teste
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de teste <<<\n');

% Carrega a matriz de teste pré-computada para o teste
load(caminhoTeste)

% Checa número de imagens
nrImagens = size(treinoV,2);

% Guarda os dados de teste
testeV = treinoV;
testeL = treinoL;
classesTesteV = classesV;
classesTesteL = classesL;

% Definindo distâncias para print
distancias = {'Euclidiana','Manhattan','Chebyshev','Cosseno','Mahalanobis','Minkowski','Correlação'};

% ===================================================================================================================
% Carrega os dados de treino
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de treinamento <<<\n');

% Carrega a matriz de treino pré-computada para o treino
load(caminhoTreino)

% Variando entre as distâncias
for distancia=1:7

    % Contador por distância
    inicioDistancias = cputime;

    % Mensagem indicando a distância testada
    fprintf(1,'\n>>> Distância: %s  <<<\n',distancias{distancia});

    % Constrói o resultado: Resultado.resultados = [valor de k, resultado infravermelho, resultado infravermelho]
    resultado.distancia = distancias{distancia};
    resultado.resultados = [];

    % Para escrita dos resultados na matriz
    l = 1;

    % Varia os valores de k em 2 de 1 até 9
    for k=1:+2:5

        % Mensagem indicando os valores de k testados
        fprintf(1,'\n>>> Valor de k: %d <<<',k);

        % Calucla para nr de Eigenfaces de 20 em 20
        for t=10:+10:50

            % Mensagem indicando o número de Eigenfaces
            fprintf(1,'\n>>> Número de Eigenfaces: %d <<<',t);

            % Executa o eigenfaces no conjunto visível
            resV = eigenfaces(treinoV,classesV,t);

            % Executa o eigenfaces no conjunto infravermelho
            resL = eigenfaces(treinoL,classesL,t);

            % Reseta os acertos para cada um
            acertosV = 0;
            acertosL = 0;

            % Faz a classificação de cada imagem no conjunto de teste
            for i=1:nrImagens

                % Gera o set de teste Visível
                imgTesteV = testeV(:,i);
                classeTesteV = classesTesteV(i);

                % Gera o set de teste Infravermelho
                imgTesteL = testeL(:,i);
                classeTesteL = classesTesteL(i);

                % Faz o reconhecimento da imagem visível
                recV = eigenfacesRec(resV, imgTesteV, distancia, k, false);

                % Faz o reconhecimento da imagem infravermelha
                recL = eigenfacesRec(resL, imgTesteL, distancia, k, false);

                % Incrementa o contador visível
                if(classeTesteV == recV)
                    acertosV = acertosV + 1;
                end

                % Incrementa o contador infravermelho
                if(classeTesteL == recL)
                    acertosL = acertosL + 1;
                end
            end

            % Calcula a taxa de acerto visível
            totalV = acertosV\nrImagens;

            % Calcula a taxa de acerto infravermelha
            totalL = acertosL\nrImagens;

            % Printa os resultados
            %fprintf(1,'\n>>> Acertos - Visível : %d | Acertos - Infravermelho: %d <<<\n',acertosV,acertosL)

            % Guarda dos resultados
            resultado.resultados(l,:) = [k, t, totalV, totalL];

            % Contador de linhas da matriz de resultados
            l = l+1;
        end
    end

    fimDistancias = cputime-inicioDistancias;

    % Mensagem de fim do reconhecimento
    fprintf(1,'\n>>> %s finalizada em: %f segundos <<<\n',distancias{distancia},fimDistancias)

    % Guarda o tempo gasto
    resultado.tempo = fimDistancias;

    % Adiciona nos resultados finais
    resultadosFinais{distancia} = resultado;
end

% Printa resultados finais
%fprintf(1,'\n>>> Resultados Finais <<<\n')
%for i=1:3
    %fprintf(1,'\n>>> Distância: %s | Tempo: %f segundos <<<\n',resultadosFinais{i}.distancia,resultadosFinais{i}.tempo)
    %resultadosFinais{i}.resultados
%end

% Mensagem de fim
fprintf(1,'\n>>> Twon X Dark finalizado <<<\n')

% Salva resultados
save('./Resultados/Resultado_Eigenfaces_Twon_x_Dark.mat','resultadosFinais');

% ===================================================================================================================
% Twon X Off
% ===================================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Realizando o reconhecimento <<<\n>>> Treino: Twon | Teste: Off <<<\n')

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Off.mat';

% Matriz para guardar os resultados finais
resultadosFinais = {};

% ===================================================================================================================
% Carrega os dados de teste
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de teste <<<\n');

% Carrega a matriz de teste pré-computada para o teste
load(caminhoTeste)

% Checa número de imagens
nrImagens = size(treinoV,2);

% Guarda os dados de teste
testeV = treinoV;
testeL = treinoL;
classesTesteV = classesV;
classesTesteL = classesL;

% ===================================================================================================================
% Carrega os dados de treino
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de treinamento <<<\n');

% Carrega a matriz de treino pré-computada para o treino
load(caminhoTreino)

% Variando entre as distâncias
for distancia=1:7

    % Contador por distância
    inicioDistancias = cputime;

    % Mensagem indicando a distância testada
    fprintf(1,'\n>>> Distância: %s  <<<\n',distancias{distancia});

    % Constrói o resultado: Resultado.resultados = [valor de k, resultado infravermelho, resultado infravermelho]
    resultado.distancia = distancias{distancia};
    resultado.resultados = [];

    % Para escrita dos resultados na matriz
    l = 1;

    % Varia os valores de k em 2 de 1 até 9
    for k=1:+2:5

        % Mensagem indicando os valores de k testados
        fprintf(1,'\n>>> Valor de k: %d <<<',k);

        % Calucla para nr de Eigenfaces de 20 em 20
        for t=10:+10:50

            % Mensagem indicando o número de Eigenfaces
            fprintf(1,'\n>>> Número de Eigenfaces: %d <<<',t);

            % Executa o eigenfaces no conjunto visível
            resV = eigenfaces(treinoV,classesV,t);

            % Executa o eigenfaces no conjunto infravermelho
            resL = eigenfaces(treinoL,classesL,t);

            % Reseta os acertos para cada um
            acertosV = 0;
            acertosL = 0;

            % Faz a classificação de cada imagem no conjunto de teste
            for i=1:nrImagens

                % Gera o set de teste Visível
                imgTesteV = testeV(:,i);
                classeTesteV = classesTesteV(i);

                % Gera o set de teste Infravermelho
                imgTesteL = testeL(:,i);
                classeTesteL = classesTesteL(i);

                % Faz o reconhecimento da imagem visível
                recV = eigenfacesRec(resV, imgTesteV, distancia, k, false);

                % Faz o reconhecimento da imagem infravermelha
                recL = eigenfacesRec(resL, imgTesteL, distancia, k, false);

                % Incrementa o contador visível
                if(classeTesteV == recV)
                    acertosV = acertosV + 1;
                end

                % Incrementa o contador infravermelho
                if(classeTesteL == recL)
                    acertosL = acertosL + 1;
                end
            end

            % Calcula a taxa de acerto visível
            totalV = acertosV\nrImagens;

            % Calcula a taxa de acerto infravermelha
            totalL = acertosL\nrImagens;

            % Printa os resultados
            %fprintf(1,'\n>>> Acertos - Visível : %d | Acertos - Infravermelho: %d <<<\n',acertosV,acertosL)

            % Guarda dos resultados
            resultado.resultados(l,:) = [k, t, totalV, totalL];

            % Contador de linhas da matriz de resultados
            l = l+1;
        end
    end

    fimDistancias = cputime-inicioDistancias;

    % Mensagem de fim do reconhecimento
    fprintf(1,'\n>>> %s finalizada em: %f segundos <<<\n',distancias{distancia},fimDistancias)

    % Guarda o tempo gasto
    resultado.tempo = fimDistancias;

    % Adiciona nos resultados finais
    resultadosFinais{distancia} = resultado;
end

% Printa resultados finais
%fprintf(1,'\n>>> Resultados Finais <<<\n')
%for i=1:3
    %fprintf(1,'\n>>> Distância: %s | Tempo: %f segundos <<<\n',resultadosFinais{i}.distancia,resultadosFinais{i}.tempo)
    %resultadosFinais{i}.resultados
%end

% Mensagem de fim
fprintf(1,'\n>>> Twon X Off finalizado <<<\n')

% Salva resultados
save('./Resultados/Resultado_Eigenfaces_Twon_x_Off.mat','resultadosFinais');

% ===================================================================================================================
% Twon X Ron
% ===================================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Realizando o reconhecimento <<<\n>>> Treino: Ron | Teste: Dark <<<\n')

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Ron.mat';

% Matriz para guardar os resultados finais
resultadosFinais = {};

% ===================================================================================================================
% Carrega os dados de teste
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de teste <<<\n');

% Carrega a matriz de teste pré-computada para o teste
load(caminhoTeste)

% Checa número de imagens
nrImagens = size(treinoV,2);

% Guarda os dados de teste
testeV = treinoV;
testeL = treinoL;
classesTesteV = classesV;
classesTesteL = classesL;

% ===================================================================================================================
% Carrega os dados de treino
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de treinamento <<<\n');

% Carrega a matriz de treino pré-computada para o treino
load(caminhoTreino)

% Variando entre as distâncias
for distancia=1:7

    % Contador por distância
    inicioDistancias = cputime;

    % Mensagem indicando a distância testada
    fprintf(1,'\n>>> Distância: %s  <<<\n',distancias{distancia});

    % Constrói o resultado: Resultado.resultados = [valor de k, resultado infravermelho, resultado infravermelho]
    resultado.distancia = distancias{distancia};
    resultado.resultados = [];

    % Para escrita dos resultados na matriz
    l = 1;

    % Varia os valores de k em 2 de 1 até 9
    for k=1:+2:5

        % Mensagem indicando os valores de k testados
        fprintf(1,'\n>>> Valor de k: %d <<<',k);

        % Calucla para nr de Eigenfaces de 20 em 20
        for t=10:+10:50

            % Mensagem indicando o número de Eigenfaces
            fprintf(1,'\n>>> Número de Eigenfaces: %d <<<',t);

            % Executa o eigenfaces no conjunto visível
            resV = eigenfaces(treinoV,classesV,t);

            % Executa o eigenfaces no conjunto infravermelho
            resL = eigenfaces(treinoL,classesL,t);

            % Reseta os acertos para cada um
            acertosV = 0;
            acertosL = 0;

            % Faz a classificação de cada imagem no conjunto de teste
            for i=1:nrImagens

                % Gera o set de teste Visível
                imgTesteV = testeV(:,i);
                classeTesteV = classesTesteV(i);

                % Gera o set de teste Infravermelho
                imgTesteL = testeL(:,i);
                classeTesteL = classesTesteL(i);

                % Faz o reconhecimento da imagem visível
                recV = eigenfacesRec(resV, imgTesteV, distancia, k, false);

                % Faz o reconhecimento da imagem infravermelha
                recL = eigenfacesRec(resL, imgTesteL, distancia, k, false);

                % Incrementa o contador visível
                if(classeTesteV == recV)
                    acertosV = acertosV + 1;
                end

                % Incrementa o contador infravermelho
                if(classeTesteL == recL)
                    acertosL = acertosL + 1;
                end
            end

            % Calcula a taxa de acerto visível
            totalV = acertosV\nrImagens;

            % Calcula a taxa de acerto infravermelha
            totalL = acertosL\nrImagens;

            % Printa os resultados
            %fprintf(1,'\n>>> Acertos - Visível : %d | Acertos - Infravermelho: %d <<<\n',acertosV,acertosL)

            % Guarda dos resultados
            resultado.resultados(l,:) = [k, t, totalV, totalL];

            % Contador de linhas da matriz de resultados
            l = l+1;
        end
    end

    fimDistancias = cputime-inicioDistancias;

    % Mensagem de fim do reconhecimento
    fprintf(1,'\n>>> %s finalizada em: %f segundos <<<\n',distancias{distancia},fimDistancias)

    % Guarda o tempo gasto
    resultado.tempo = fimDistancias;

    % Adiciona nos resultados finais
    resultadosFinais{distancia} = resultado;
end

% Printa resultados finais
%fprintf(1,'\n>>> Resultados Finais <<<\n')
%for i=1:3
    %fprintf(1,'\n>>> Distância: %s | Tempo: %f segundos <<<\n',resultadosFinais{i}.distancia,resultadosFinais{i}.tempo)
    %resultadosFinais{i}.resultados
%end

% Mensagem de fim
fprintf(1,'\n>>> Twon X Ron finalizado <<<\n')

% Salva resultados
save('./Resultados/Resultado_Eigenfaces_Twon_x_Ron.mat','resultadosFinais');

% ===================================================================================================================
% Twon X Lon
% ===================================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Realizando o reconhecimento <<<\n>>> Treino: Lon | Teste: Dark <<<\n')

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Lon.mat';

% Matriz para guardar os resultados finais
resultadosFinais = {};

% ===================================================================================================================
% Carrega os dados de teste
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de teste <<<\n');

% Carrega a matriz de teste pré-computada para o teste
load(caminhoTeste)

% Checa número de imagens
nrImagens = size(treinoV,2);

% Guarda os dados de teste
testeV = treinoV;
testeL = treinoL;
classesTesteV = classesV;
classesTesteL = classesL;

% ===================================================================================================================
% Carrega os dados de treino
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de treinamento <<<\n');

% Carrega a matriz de treino pré-computada para o treino
load(caminhoTreino)

% Variando entre as distâncias
for distancia=1:7

    % Contador por distância
    inicioDistancias = cputime;

    % Mensagem indicando a distância testada
    fprintf(1,'\n>>> Distância: %s  <<<\n',distancias{distancia});

    % Constrói o resultado: Resultado.resultados = [valor de k, resultado infravermelho, resultado infravermelho]
    resultado.distancia = distancias{distancia};
    resultado.resultados = [];

    % Para escrita dos resultados na matriz
    l = 1;

    % Varia os valores de k em 2 de 1 até 9
    for k=1:+2:5

        % Mensagem indicando os valores de k testados
        fprintf(1,'\n>>> Valor de k: %d <<<',k);

        % Calucla para nr de Eigenfaces de 20 em 20
        for t=10:+10:50

            % Mensagem indicando o número de Eigenfaces
            fprintf(1,'\n>>> Número de Eigenfaces: %d <<<',t);

            % Executa o eigenfaces no conjunto visível
            resV = eigenfaces(treinoV,classesV,t);

            % Executa o eigenfaces no conjunto infravermelho
            resL = eigenfaces(treinoL,classesL,t);

            % Reseta os acertos para cada um
            acertosV = 0;
            acertosL = 0;

            % Faz a classificação de cada imagem no conjunto de teste
            for i=1:nrImagens

                % Gera o set de teste Visível
                imgTesteV = testeV(:,i);
                classeTesteV = classesTesteV(i);

                % Gera o set de teste Infravermelho
                imgTesteL = testeL(:,i);
                classeTesteL = classesTesteL(i);

                % Faz o reconhecimento da imagem visível
                recV = eigenfacesRec(resV, imgTesteV, distancia, k, false);

                % Faz o reconhecimento da imagem infravermelha
                recL = eigenfacesRec(resL, imgTesteL, distancia, k, false);

                % Incrementa o contador visível
                if(classeTesteV == recV)
                    acertosV = acertosV + 1;
                end

                % Incrementa o contador infravermelho
                if(classeTesteL == recL)
                    acertosL = acertosL + 1;
                end
            end

            % Calcula a taxa de acerto visível
            totalV = acertosV\nrImagens;

            % Calcula a taxa de acerto infravermelha
            totalL = acertosL\nrImagens;

            % Printa os resultados
            %fprintf(1,'\n>>> Acertos - Visível : %d | Acertos - Infravermelho: %d <<<\n',acertosV,acertosL)

            % Guarda dos resultados
            resultado.resultados(l,:) = [k, t, totalV, totalL];

            % Contador de linhas da matriz de resultados
            l = l+1;
        end
    end

    fimDistancias = cputime-inicioDistancias;

    % Mensagem de fim do reconhecimento
    fprintf(1,'\n>>> %s finalizada em: %f segundos <<<\n',distancias{distancia},fimDistancias)

    % Guarda o tempo gasto
    resultado.tempo = fimDistancias;

    % Adiciona nos resultados finais
    resultadosFinais{distancia} = resultado;
end

% Printa resultados finais
%fprintf(1,'\n>>> Resultados Finais <<<\n')
%for i=1:3
    %fprintf(1,'\n>>> Distância: %s | Tempo: %f segundos <<<\n',resultadosFinais{i}.distancia,resultadosFinais{i}.tempo)
    %resultadosFinais{i}.resultados
%end

% Mensagem de fim
fprintf(1,'\n>>> Twon X Lon finalizado <<<\n')

% Salva resultados
save('./Resultados/Resultado_Eigenfaces_Twon_x_Lon.mat','resultadosFinais');

% ===================================================================================================================
% Twon X Exp
% ===================================================================================================================

% Mensagem de início
fprintf(1,'\n>>> Realizando o reconhecimento <<<\n>>> Treino: Twon | Teste: Exp <<<\n')

% Caminho das matrizes de treino e teste
caminhoTreino = './Matrizes/Treino_Twon.mat';
caminhoTeste = './Matrizes/Treino_Exp.mat';

% Matriz para guardar os resultados finais
resultadosFinais = {};

% ===================================================================================================================
% Carrega os dados de teste
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de teste <<<\n');

% Carrega a matriz de teste pré-computada para o teste
load(caminhoTeste)

% Checa número de imagens
nrImagens = size(treinoV,2);

% Guarda os dados de teste
testeV = treinoV;
testeL = treinoL;
classesTesteV = classesV;
classesTesteL = classesL;

% ===================================================================================================================
% Carrega os dados de treino
% ===================================================================================================================

fprintf(1,'\n>>> Carregando dados de treinamento <<<\n');

% Carrega a matriz de treino pré-computada para o treino
load(caminhoTreino)

% Variando entre as distâncias
for distancia=1:7

    % Contador por distância
    inicioDistancias = cputime;

    % Mensagem indicando a distância testada
    fprintf(1,'\n>>> Distância: %s  <<<\n',distancias{distancia});

    % Constrói o resultado: Resultado.resultados = [valor de k, resultado infravermelho, resultado infravermelho]
    resultado.distancia = distancias{distancia};
    resultado.resultados = [];

    % Para escrita dos resultados na matriz
    l = 1;

    % Varia os valores de k em 2 de 1 até 9
    for k=1:+2:5

        % Mensagem indicando os valores de k testados
        fprintf(1,'\n>>> Valor de k: %d <<<',k);

        % Calucla para nr de Eigenfaces de 20 em 20
        for t=10:+10:50

            % Mensagem indicando o número de Eigenfaces
            fprintf(1,'\n>>> Número de Eigenfaces: %d <<<',t);

            % Executa o eigenfaces no conjunto visível
            resV = eigenfaces(treinoV,classesV,t);

            % Executa o eigenfaces no conjunto infravermelho
            resL = eigenfaces(treinoL,classesL,t);

            % Reseta os acertos para cada um
            acertosV = 0;
            acertosL = 0;

            % Faz a classificação de cada imagem no conjunto de teste
            for i=1:nrImagens

                % Gera o set de teste Visível
                imgTesteV = testeV(:,i);
                classeTesteV = classesTesteV(i);

                % Gera o set de teste Infravermelho
                imgTesteL = testeL(:,i);
                classeTesteL = classesTesteL(i);

                % Faz o reconhecimento da imagem visível
                recV = eigenfacesRec(resV, imgTesteV, distancia, k, false);

                % Faz o reconhecimento da imagem infravermelha
                recL = eigenfacesRec(resL, imgTesteL, distancia, k, false);

                % Incrementa o contador visível
                if(classeTesteV == recV)
                    acertosV = acertosV + 1;
                end

                % Incrementa o contador infravermelho
                if(classeTesteL == recL)
                    acertosL = acertosL + 1;
                end
            end

            % Calcula a taxa de acerto visível
            totalV = acertosV\nrImagens;

            % Calcula a taxa de acerto infravermelha
            totalL = acertosL\nrImagens;

            % Printa os resultados
            %fprintf(1,'\n>>> Acertos - Visível : %d | Acertos - Infravermelho: %d <<<\n',acertosV,acertosL)

            % Guarda dos resultados
            resultado.resultados(l,:) = [k, t, totalV, totalL];

            % Contador de linhas da matriz de resultados
            l = l+1;
        end
    end

    fimDistancias = cputime-inicioDistancias;

    % Mensagem de fim do reconhecimento
    fprintf(1,'\n>>> %s finalizada em: %f segundos <<<\n',distancias{distancia},fimDistancias)

    % Guarda o tempo gasto
    resultado.tempo = fimDistancias;

    % Adiciona nos resultados finais
    resultadosFinais{distancia} = resultado;
end

% Printa resultados finais
%fprintf(1,'\n>>> Resultados Finais <<<\n')
%for i=1:3
    %fprintf(1,'\n>>> Distância: %s | Tempo: %f segundos <<<\n',resultadosFinais{i}.distancia,resultadosFinais{i}.tempo)
    %resultadosFinais{i}.resultados
%end

% Mensagem de fim
fprintf(1,'\n>>> Twon X Exp finalizado <<<\n')

% Salva resultados
save('./Resultados/Resultado_Eigenfaces_Twon_x_Exp.mat','resultadosFinais');

% =====================================================================================================
% Fim do reconhecimento
% =====================================================================================================

fim = cputime-inicio;

% Mensagem de fim do reconhecimento
fprintf(1,'\n>>> Reconhecimento finalizado em: %f segundos <<<\n',fim)

