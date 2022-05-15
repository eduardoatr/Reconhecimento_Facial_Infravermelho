function res = projetarImg(matriz, CP, faceMedia)
%% Projeta a matriz sobre o novo espaço vetorial
%% ===================================================================================================================
%% Entrada:
%%		matriz [(altura*largura) x nrImagens]           | matriz de vetores-imagem verticais
%%		CP [(altura*largura) x nrComponentes]           | matriz contendo as componentes principais
%%		faceMedia [(altura*largura) x 1]            	| face média do banco
%% ===================================================================================================================
%% Saída:
%%		res [nrComponentes x nrImagens]                 | projeção da matriz recebida
%% ===================================================================================================================

    % Subtrai a face média dos dados
	matriz = matriz - repmat(faceMedia, 1, size(matriz,2));

    % Faz a projeção
	res = CP'*matriz;
end
