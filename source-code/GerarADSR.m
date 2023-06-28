# Sequenciador e Sintetizador de Ficheiros MIDI
#
# Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-05
function ADSR = GerarADSR(t)
    A = linspace(0, 1, (length(t)*0.10));
    D = linspace(1, 0.8, (length(t)*0.10));
    S = linspace(0.8, 0.8, (length(t)*0.50));    % Delay de 60% do sinal
    R = 0.8* exp(linspace(0, -5, (length(t)*0.30)));  % Reta exponencial descendente
    ADSR = [A D S R];
    x = zeros(size(t));
    x(1:length(ADSR)) = ADSR;
    ADSR = x;
    subplot(2, 1, 1)
    plot(t, ADSR)
    title('Onda modulante')
end

