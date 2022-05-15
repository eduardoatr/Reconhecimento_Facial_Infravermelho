function lista = listarArquivos(caminho)
%% Recebe um caminho e retorna uma lista com os nomes dos arquivos contidos no diretório indicado
%% ===================================================================================================================
%% Entrada:
%%      caminho [char]                                  | caminho do diretório
%% ===================================================================================================================
%% Saída:
%%      lista [cell array]                              | cellarray dos nomes dos arquivos contidos no diretório
%% ===================================================================================================================

    % Lê o diretório
	lista = dir(caminho);

    % Pula os 3 primeiros itens
	lista = lista(3:length(lista));

    % Converte para cell array
	lista = struct2cell(lista);

    % Seleciona a primeira linha
	lista = lista(1,:);

end
