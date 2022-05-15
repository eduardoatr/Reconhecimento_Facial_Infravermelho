function ret = converterImg(vetorImg, largura, altura)
%% Reestruruta a imagem para sua forma original
%% ===================================================================================================================
%% Entrada:
%%      vetorImg [(altura*largura) x 1]                 | vetor-imagem de entrada
%%      largura [int]                                   | largura da imagem de saída
%%      altura [int]                                    | altura da imagem de saída
%% ===================================================================================================================
%% Saída:
%%  	ret [ largura x altura ]                        | resultado da imagem reconstruída em escala de cinza
%% ===================================================================================================================

    % Faz o reshape
	ret = reshape(normalizarImg(vetorImg, 0, 255), altura, largura);

    % Converte para inteiro
	ret = uint8(ret);
end
