## Sequenciador e Sintetizador de Ficheiros MIDI
##
## Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-08

function s = gerar_onda_dente_serra(freq, t)
    % Geração do sinal de onda dente de serra
    s = sawtooth(2*pi*freq*t);
end



