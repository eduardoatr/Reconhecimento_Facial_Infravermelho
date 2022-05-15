function modelo = fisherfaces(matriz, classes, nrComponentes)
%% Executa o Fisherfaces sobre a matriz de entrada
%% ===================================================================================================================
%% Entrada:
%%      matriz [(altura*largura) x nrImagens]           | matriz de vetores-imagem verticais
%%      classes [1 x nrImagens] classes                 | vetor contendo as classes relativas a cada �ndice da matriz
%%      nrComponentes [int]                             | n�mero de classes - 1
%% ===================================================================================================================
%% Sa�da:
%%      modelo [struct]
%%          .nome [char]                                | nome do m�todo
%%          .media [(altura*largura)x 1]                | m�dia da matriz de entrada
%%          .nrComponentes [int]                        | quantidade de componentes utilizadas
%%          .CP [(altura*largura) x nrComponentes]      | matriz contendo as componentes principais
%%          .projDados [nrComponentes x nrImagens]      | proje��o da matriz de dados
%% ===================================================================================================================

    % Verifica a quantidade de imagens
    nrImagens = size(matriz,2);

    % Verifica a quantidade de classes
    nrClasses = max(classes);

    % Se o nrComponentes n�o for definido, utiliza o n�mero m�ximo que � de (nrClasses - 1)
    if(nargin < 3)
        nrComponentes = nrClasses - 1;
    end

    % Se o nrComponentes foi maior que o poss�vel, utiliza o n�mero m�ximo
    nrComponentes = min(nrClasses-1, nrComponentes);

    % Reduz a matriz de entrada usando o PCA
    Pca = pca(matriz,(nrImagens-nrClasses));

    % Aplica o LDA sobre as proje��es geradas com o PCA
    Lda = lda(projetarImg(matriz, Pca.CP, Pca.faceMedia), classes, nrComponentes);

    % Constr�i modelo
    modelo.nome = 'lda';
    modelo.media = repmat(0, size(matriz,1), 1);
    modelo.eigenValues = Lda.eigenValues;
    modelo.CP = Pca.CP*Lda.CP;
    modelo.projDados = modelo.CP'*matriz;
    modelo.nrComponentes = Lda.nrComponentes;
    modelo.classes = classes;
end
