# Sequenciador e Sintetizador de Ficheiros MIDI
#
# Autor: Romilson Monteiro e Belizarde Té
## Created: 2023-06-08

function  reproduzir_salvar_sinal(sinal, fa, nome_arquivo)
  sound(sinal, fa);
  path = ['../output/' nome_arquivo ];
   disp('Reproduzindo o sinal sintetizado...');
    audiowrite(path , sinal, fa);
     disp(['O arquivo sintetizado foi salvo com o nome de ' nome_arquivo '_Sintetizado.wav']);
end
