## Sequenciador e Sintetizador de Ficheiros MIDI
##
## Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-08


function y = gerar_onda_estreito(frequencia, t)
    ciclo = sin(2*pi*frequencia*t);
    % Aplica um ciclo de trabalho de 10%
    duty_cycle = 0.1;
    largura_do_pulso = round(duty_cycle * length(t));

    % Desloca a forma de onda para criar o pulso estreito
    y = [zeros(1, round((length(t) - largura_do_pulso) / 2)) ciclo zeros(1, round((length(t) - largura_do_pulso) / 2))];
end







