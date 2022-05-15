function c = knn(treino, classes, teste, distancia, k, plot)
%% Classifica a entrada através do algoritmo k-NN
%% ===================================================================================================================
%% Entrada:
%%      treino [(altura*largura) x nrImagens]           | matriz contendo os valores de treino
%%      classes [1 x nrImagens]                         | vetor contendo as classes relativas a cada índice da matriz de treino
%%      teste [(altura*largura) x 1]                    | matriz contendo os valores de teste
%%      distancia [int]                                 | distância utilizada: 1 = euclidiana | 2 = manhattan | 3 = chebyshev | 4 = cosseno | 5 = mahalanobis | 6 = minkowski | 7 = correlação
%%      k [int]                                         | quantidade de vizinhos mais próximos
%%      plot [int]                                      | flag para plotar os gráficos: 1 = true | = 0 false
%% ===================================================================================================================
%% Saída:
%%      c [int]                                         | classe atribuída à imagem teste
%% ===================================================================================================================

    % Flag para o cálculo do desempate
    flag = true;

    % Quantidade de amostras de treino
    n = size(treino,2);

    % Se k não for definido, utiliza-se o vizinho mais próximo, k = 1 ou
    % caso k > n utiliza-se o número máximo de vizinhos
    if (nargin == 3)
        k=1;
    elseif (k>n)
        k=n;
    end

    % Replica a entrada n vezes
    teste = repmat(teste, 1, n);

    % Calcula a distância euclidiana caso nenhuma outra tenha sido definida
    if((distancia == 1) || (distancia == 0) || (distancia > 7))

        distancias = pdist2(treino',teste','euclidean');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA EUCLIDIANA')
        end
    end

    % Calcula a distância de mahattan
    if(distancia == 2)

        distancias = pdist2(treino',teste','cityblock');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA DE MANHATTAN')
        end
    end

    % Calcula a distância de chebyshev
    if(distancia == 3)

        distancias = pdist2(treino',teste','chebychev');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA CHEBYSHEV')
        end
    end

    % Calcula a distância cosseno
    if(distancia == 4)

        distancias = pdist2(treino',teste','cosine');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA COSSENO')
        end
    end

    % Calcula a distância de mahalanobis
    if(distancia == 5)

        distancias = pdist2(treino',teste','mahalanobis');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA DE MAHALANOBIS')
        end
    end

    % Calcula a distância de minkowski
    if(distancia == 6)

        distancias = pdist2(treino',teste','minkowski');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA DE MINKOWSKI')
        end
    end

    % Calcula a distância de correlação
    if(distancia == 7)

        distancias = pdist2(treino',teste','correlation');

        if(plot == true)
            % Plota as distâncias
            figure('Name','Distâncias');
            kk = 1:size(distancias,2);
            stem(kk,distancias)
            title('DISTÂNCIA DE CORRELAÇÃO')
        end
    end

    % Ordena de forma crescente
    [distancias, indices] = sort(distancias);

    % Reordena as classes de acordo com as distâncias
    classes = classes(indices);

    while(flag == true)

        % Verifica as classes dos k vizinhos
        classes2 = classes(1:k);

        % Conta a quantidade de vizinhos de cada classe
        h = histc(classes2,(1:max(classes2)));

        % Verifica a classe dominante
        [v,c] = max(h);

        % Verifica se existe empate
        [linhas colunas] = size(find(h == v));

        % Se não existe existir empate retorna, se existir reduz valor de k
        if((linhas+colunas)==2)
            flag = false;
        else
            k = k-1;
        end
    end
end
