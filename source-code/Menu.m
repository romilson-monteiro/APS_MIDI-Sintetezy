# Sequenciador e Sintetizador de Ficheiros MIDI
#
# Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-08

function escolha = Menu()
    disp('Escolha um Tipo de Onda para Sintetizar o Arquivo MIDI');
    disp('  1. Onda sinoidal');
    disp('  2. Onda triangular');
    disp('  3. Onda quadrada');
    disp('  4. Onda dente de serra');
    disp('  5. Onda pulso estreito');
    disp('  6. Onda ruído');

    escolha = input('Digite o número: [Default: triangular] >> ');
    while ~ismember(escolha, 1:6)
        disp('!!Opcao inválida!! Por favor, escolha um número válido.');
        escolha = input('Digite o número: [Default: 2] >> ');
    end
end

