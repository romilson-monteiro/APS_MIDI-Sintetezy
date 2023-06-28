## Sequenciador e Sintetizador de Ficheiros MIDI
##
## Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-08
function s = gerar_onda_ruido(freq, t)
    % Gera a forma de onda senoidal fundamental
    s = sin(2*pi*freq*t);
    % Adiciona ruído aleatório à forma de onda
    amplitude_ruido = 0.2; % Ajuste a amplitude do ruído conforme necessário
    ruido = amplitude_ruido * randn(size(t));
    % Adiciona o ruído à forma de onda
    s = s + ruido;
end





