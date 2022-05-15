function classe = eigenfacesRec(modelo, imgTeste, distancia, k, plot)
%% Classifica o modelo de acordo com os k vizinhos mais próximos
%% ===================================================================================================================
%% Entrada:
%%      modelo [struct]                                 | modelo para a classificação
%%		imgTeste [(altura*largura) x 1]                 | vetor-imagem de teste
%%      distancia [int]                                 | euclidiana = 1 | manhatthan = 2 | chebyshev = 3 | cosseno = 4 | mahalanobis = 5 | minkowski = 6 | correlação = 7
%%      k [int]                                         | quantidade de vizinhos mais próximos
%%      plot [int]                                      | flag para plotar os gráficos: 1 = true | = 0 false
%% ===================================================================================================================
%% Saída:
%%      classe [int]                                    | classe da imagem teste
%% ===================================================================================================================

    % Se k não for definido, utiliza-se o vizinho mais próximo, k = 1
    if(nargin < 3)
        k = 1;
    end

    % Faz a projeção da imagem teste
	teste = modelo.CP' * (imgTeste - modelo.faceMedia);

    % Classifica usando o KNN
	classe = knn(modelo.projDados, modelo.classes, teste, distancia, k, plot);
end
