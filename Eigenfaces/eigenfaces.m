function modelo = eigenfaces(matriz, classes, nrComponentes)
%% Executa o Eigenfaces sobre a matriz de entrada
%% ===================================================================================================================
%% Entrada:
%%      matriz [(altura*largura) x nrImagens]           | matriz de vetores-imagem verticais
%%      classes [1 x nrImagens]                         | vetor contendo as classes relativas a cada índice da matriz
%%      nrComponentes [int]                             | quantidade de componentes para se utilizar
%% ===================================================================================================================
%% Saída:
%%      modelo [struct]
%%          .nome [char]                                | nome do método
%%          .faceMedia [(altura*largura) x 1]           | face média do banco
%%          .nrComponentes [int]                        | quantidade de componentes utilizadas
%%          .CP [(altura*largura) x nrComponentes]      | matriz contendo as componentes principais
%%          .projDados [nrComponentes x nrImagens]      | projeção da matriz de dados
%% ===================================================================================================================

    % Se o nrComponentes não for definido, utiliza o número máximo que é de (NrImagens - 1)
    if(nargin < 3 || nrComponentes == 0)
        nrComponentes=size(matriz,2)-1;
    end

    % Executa o PCA
    Pca = pca(matriz, nrComponentes);

    % Constrói o modelo
    modelo.nome = 'eigenfaces';
    modelo.eigenValues = Pca.eigenValues;
    modelo.CP = Pca.CP;
    modelo.nrComponentes = nrComponentes;
    modelo.faceMedia = Pca.faceMedia;

    % Projeta os dados do banco, criando um vetor de pesos para cada imagem
    modelo.projDados = modelo.CP'*(matriz - repmat(Pca.faceMedia, 1, size(matriz,2)));

    % Guarda as classes
    modelo.classes = classes;
end
