## Sequenciador e Sintetizador de Ficheiros MIDI
##
## Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-03

function s = gerar_onda_triangular(freq, t)
    % Geração do sinal de onda triangular utilizando a série de Fourier
    s = zeros(size(t));
    for n = 1:2:1000
        k = (n-1)/2;
        s = s + (8/((pi*n)^2)) * sin(2*pi*n*freq*t) * (-1)^(k-1);
    end
end

