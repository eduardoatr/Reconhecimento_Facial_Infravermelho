function res = normalizarImg(vetorImg, l, h)
%% Recebe um vetor-imagem e normaliza para valovetorImg de l a h
%% ===================================================================================================================
%% Entrada:
%%      vetorImg [(altura*largura) x 1]                 | vetor-imagem para ser normalizado
%%      l [int]                                         | valor mínimo
%%      h [int]                                         | valor máximo
%% ===================================================================================================================
%% Saída:
%%      res                                             | vetor normalizado resultante
%% ===================================================================================================================

    % Obtém os valores máximos e mínimos do vetor respectivamente
    minImg = min(vetorImg);
	maxImg = max(vetorImg);

    % Faz os cálculos
	res = vetorImg - minImg;
	res = res ./ (maxImg - minImg);
	res = res .* (h-l);
	res = res + l;
end
