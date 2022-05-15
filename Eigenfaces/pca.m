function modelo = pca(matriz, nrComponentes)
%% Executa o PCA sobre a matriz de entrada
%% ===================================================================================================================
%% Entrada:
%%      matriz [(altura*largura) x nrImagens]           | matriz de vetores-imagem verticais
%%      nrComponentes [int]                             | quantidade de componentes para se utilizar
%% ===================================================================================================================
%% Saída:
%%      modelo [struct]
%%          .nome [char]                                | nome do método
%%          .faceMedia [(altura*largura) x 1]           | face média do banco
%%          .nrComponentes [int]                        | quantidade de componentes utilizadas
%%          .CP [(altura*largura) x nrComponentes]      | matriz contendo as componentes principais
%% ===================================================================================================================

    % Se o nrComponentes não for definido, utiliza o número máximo que é de (NrImagens - 1)
    if(nargin < 2)
        nrComponentes = size(matriz,2)-1;
    end

    % Calcula a face média
    faceMedia = mean(matriz,2);

    % Centraliza os dados (subtrai a face média)
    matriz = matriz - repmat(faceMedia, 1, size(matriz,2));

    % Faz a decomponsição (SVD) dos dados centralizados tal que A = U*S*V'
    % eigenValues = matriz diagonal com os eigenvalues em ordem decrescente
    [eigenVectors,eigenValues,V] = svd(matriz ,'econ');

    % Construindo o modelo com os nrComponentes
    modelo.nome = 'pca';
    modelo.eigenValues = diag(eigenValues).^2;
    modelo.eigenValues = modelo.eigenValues(1:nrComponentes);
    modelo.CP = eigenVectors(:,1:nrComponentes);
    modelo.nrComponentes = nrComponentes;
    modelo.faceMedia = faceMedia;
end
