function [matrizV matrizL classesV classesL largura altura nomes] = lerImgs(caminho, expressao, iluminacao)
%% Lê as imagens contidas no diretório indicado gerando suas matrizes
%% ===================================================================================================================
%% Entrada:
%%      caminho [char]                                  | caminho do diretório
%%      expressao [int]                                 | flag de leitura das imagens com expressões: 1 = true | = 0 false
%%      iluminacao [5 x 6]                              | flag de leitura das imagens com variação de iluminação: 1 = true | = 0 false | [iluminacao,2on,Dark,Lon,Off,Ron]
%% ===================================================================================================================
%% Saída:
%%      matrizV [(altura*largura) x nrImagens]          | matriz de vetores imagem verticais das imagens do espectro infravermelho
%%      matrizL [(altura*largura) x nrImagens]          | matriz de vetores imagem verticais das imagens do espectro visível
%%      classesV [1 x nrImagens]                        | vetor contendo as classes relativas a cada índice da matrizV
%%      classesL [1 x nrImagens]                        | vetor contendo as classes relativas a cada índice da matrizL
%%      largura [int]                                   | largura das imagens
%%      altura [int]                                    | altura das imagens
%%      nomes [cell array]                              | nome de cada classe
%% ===================================================================================================================

    % Inicializa as variáveis
	diretorioPrincipal = listarArquivos(caminho);
	matrizV = [];
    matrizL = [];
	classesV = [];
    classesL = [];
	nomes = {};
	n = 1; % contador de classes
    largura = 0;
    altura = 0;

    % Lista os arquivos de cada diretório dentro do diretório principal
	for w=1:length(diretorioPrincipal)

        % Reseta flag
        added = 0;

        % Um diretório de fotos por indivíduo
		nome = diretorioPrincipal{w};

        % Lista os subderetórios
		subDiretorios = listarArquivos([caminho, filesep, nome]);

        % Adiciona o nome a lista de classes
        if(~length(subDiretorios) == 0)
            % Adiciona a lista de nomes
            nomes{n} = nome;

            % Seta o flag
            added = 1;
        end

        % Lê as imagens de cada subdiretório
       	for q=1:length(subDiretorios)

            % Seleciona o tipo de imagem que vai ser lida
            tipo = subDiretorios{q};

            % Verifica se é pra ler expressões e se é o diretório atual
            if((expressao == 1) && strcmp(tipo,'Expression'))

                % Lista os subsubdiretórios (variações nas expressões e iluminação)
                subSubDiretorios = listarArquivos([caminho, filesep, nome, filesep, tipo]);

                 % Lê as imagens de cada subsubdiretório
                for i=1:length(subSubDiretorios)

                    % Seleciona o tipo de imagem que vai ser lida
                    subSub = subSubDiretorios{i};

                    % Recupera as imagens dentro do diretório
                    imagens = listarArquivos([caminho, filesep, nome, filesep, tipo, filesep, subSub]);

                    % Ignora diretórios vazios
                    if(length(imagens) == 0)
                        continue;
                    end

                    % Adiciona as imagens à matriz e ao vetor de classes
                    for j=1:length(imagens)

                        % Gera o caminho absoluto para o arquivo
                        filename = [caminho, filesep, nome, filesep, tipo, filesep, subSub, filesep, imagens{j}];

                        % Le as imagens
                        try
                            T = double(imread(filename));
                        catch
                            lerr = lasterror;
                            fprintf(1,'Erro ao ler a imagem: %s\n', filename)
                        end

                        [altura largura canais] = size(T);

                        % Converte para escala de cinza caso seja colorida
                        if(canais == 3)
                            T = (T(:,:,1) + T(:,:,2) + T(:,:,3)) / 3;
                        end

                        % Verifica o tipo de imagem (V ou L)
                        if(imagens{j}(1) == 'L')
                            % Adiciona os dados
                            try
                                % Faz o reshape da imagem e adiciona
                                matrizL = [matrizL, reshape(T,largura*altura,1)];

                                % Adiciona a classe ao vetor
                                classesL = [classesL, n];
                            catch
                                lerr = lasterror;
                                fprintf(1,'Erro ao concatenar a imagem\n')
                            end
                        else
                            if(imagens{j}(1) == 'V')
                                % Adiciona os dados
                                try
                                    % Faz o reshape da imagem e adiciona
                                    matrizV = [matrizV, reshape(T,largura*altura,1)];

                                    % Adiciona a classe ao vetor
                                    classesV = [classesV, n];
                                catch
                                    lerr = lasterror;
                                    fprintf(1,'Erro ao concatenar a imagem\n')
                                end
                            end
                        end
                    end
                end
            end

            % Verifica se é pra ler iluminacao e se é o diretório atual
            if((iluminacao(1) == 1) && strcmp(tipo,'Illumination'))

                % Lista os subsubdiretórios (variações nas expressões e iluminação)
                subSubDiretorios = listarArquivos([caminho, filesep, nome, filesep, tipo]);

                 % Lê as imagens de cada subsubdiretório
                for i=1:length(subSubDiretorios)

                    % Seleciona o tipo de imagem que vai ser lida
                    subSub = subSubDiretorios{i};

                    % Verifica a leitura apenas dos tipos desejados
                    if((strcmp(subSub,'2on') && (iluminacao(2) == true)) || (strcmp(subSub,'Dark') && (iluminacao(3) == true)) || (strcmp(subSub,'Lon') && (iluminacao(4) == true)) || (strcmp(subSub,'Off') && (iluminacao(5) == true)) || (strcmp(subSub,'Ron') && (iluminacao(6) == true)))

                        % Recupera as imagens dentro do diretório
                        imagens = listarArquivos([caminho, filesep, nome, filesep, tipo, filesep, subSub]);

                        % Ignora diretórios vazios
                        if(length(imagens) == 0)
                            continue;
                        end

                        % Adiciona as imagens à matriz e ao vetor de classes
                        for j=1:length(imagens)

                            % Gera o caminho absoluto para o arquivo
                            filename = [caminho, filesep, nome, filesep, tipo, filesep, subSub, filesep, imagens{j}];

                            % Lê as imagens
                            try
                                T = double(imread(filename));
                            catch
                                lerr = lasterror;
                                fprintf(1,'Erro ao ler a imagem: %s\n', filename)
                            end

                            [altura largura canais] = size(T);

                            % Converte para escala de cinza caso seja colorida
                            if(canais == 3)
                                T = (T(:,:,1) + T(:,:,2) + T(:,:,3)) / 3;
                            end

                            % Verifica o tipo de imagem (V ou L)
                            if(imagens{j}(1) == 'L')
                                % Adiciona os dados
                                try
                                    % Faz o reshape da imagem e adiciona
                                    matrizL = [matrizL, reshape(T,largura*altura,1)];

                                    % Adiciona a classe ao vetor
                                    classesL = [classesL, n];
                                catch
                                    lerr = lasterror;
                                    fprintf(1,'Erro ao concatenar a imagem\n')
                                end
                            else
                                if(imagens{j}(1) == 'V')
                                    % Adiciona os dados
                                    try
                                        % Faz o reshape da imagem e adiciona
                                        matrizV = [matrizV, reshape(T,largura*altura,1)];

                                        % Adiciona a classe ao vetor
                                        classesV = [classesV, n];
                                    catch
                                        lerr = lasterror;
                                        fprintf(1,'Erro ao concatenar a imagem\n')
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        % Incrimenta o contador de classes para o indivíduo adicionado
        if ~(added == 0)
            n = n + 1;
        end
	end
end
