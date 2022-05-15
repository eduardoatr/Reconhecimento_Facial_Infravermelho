function modelo = lda(matriz, classes, nrComponentes)
%% Executa o LDA sobre a matriz de entrada
%% ===================================================================================================================
%% Entrada:
%%      matriz [(altura*largura) x quantidade]          | matriz de vetores-imagem verticais
%%      classes [1 x quantidade]                        | vetor contendo as classes relativas a cada índice da matriz
%%      nrComponentes [int]                             | número de classes - 1
%% ===================================================================================================================
%% Saída:
%%      modelo [struct]
%%          .nome [char]                                | nome do método
%%          .nrComponentes [int]                        | quantidade de componentes utilizadas
%%          .CP [(altura*largura) x nrComponentes]      | matriz contendo as componentes principais
%% ===================================================================================================================

    % Verifica o tamanho de cada vetor imagem
    tamanho = size(matriz,1);

    % Verifica o número de classes
    nrClasses = max(classes);

    % Se o nrComponentes não for definido, utiliza o número máximo que é de (nrClasses - 1)
    if(nargin < 3)
        nrComponentes = nrClasses - 1;
    end

    % Se o nrComponentes foi maior que o possível, utiliza o número máximo
    nrComponentes = min(nrClasses-1,nrComponentes);

    % Média total dos dados de entrada
    mediaTotal = mean(matriz,2);

    % Matrizes para calcular a dispresão (Scatter) interna e externa
    Sw = zeros(tamanho,tamanho);
    Sb = zeros(tamanho,tamanho);

    % Para cada classe
    for i=1:nrClasses

        % Encontra as imagens de cada classe
        temp = matriz(:,find(classes==i));

        % Calcula a média da classe
        mediaClasse = mean(temp,2);

        % Centraliza os dados (subtrai a média)
        temp = temp - repmat(mediaClasse, 1, size(temp,2));

        % Calcula o scatter intra-classe
        Sw = Sw + temp*temp';

        % Calcula o scatter extra-classe
        Sb = Sb + size(temp,2)*(mediaClasse-mediaTotal)*(mediaClasse-mediaTotal)';
    end

    % Encontra os autovalores e autovetores
    [eigenVectors, eigenValues] = eig(Sb,Sw);

    % Seleciona a diaginal e ordena do maior para menor
    [eigenValues, indice] = sort(diag(eigenValues), 1, 'descend');

    % Seleciona a componente com maior autovalor
    eigenVectors = eigenVectors(:,indice);

    % Constrói o modelo
    modelo.nome = 'lda';
    modelo.nrComponentes = nrComponentes;
    modelo.eigenValues = eigenValues(1:nrComponentes);
    modelo.CP = eigenVectors(:,1:nrComponentes);
end
