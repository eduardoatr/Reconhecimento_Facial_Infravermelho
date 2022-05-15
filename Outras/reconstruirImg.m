function ret = reconstuirImg(componentes, projecao, faceMedia)
%% Reconstrói a imagem utilizando sua projeção, as componentes principais e a face média
%% ===================================================================================================================
%% Entrada:
%%      componentes [(altura*largura) x nrComponentes]  | componentes principais usadas na reconstrução
%%      projecao [nrComponentes x nrImagens]            | projecão dos dados
%%      faceMedia [(altura*largura) x 1]                | face média do banco
%% ===================================================================================================================
%% Saída:
%%      ret [(altura*largura) x nrImagens]              | imagem reconstruída
%% ===================================================================================================================

    % Se a face média não for fornecida
    if(nargin<3)
        ret = componentes * projecao;
    else
        ret = componentes*projecao +repmat(faceMedia,size(projecao,2),1);
    end
end
