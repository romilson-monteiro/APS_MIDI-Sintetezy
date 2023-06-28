# Sequenciador e Sintetizador de Ficheiros MIDI
#
# Autor: Romilson Monteiro e Belizarde Té
# Data de criação: 08-06-2023

function main()
    clear all; clc; close all;
    caminhoBibliotecaMIDI = '..\midiFunctions';
    addpath(caminhoBibliotecaMIDI);
4
    % Carregar as funções readmidi() e midiInfo() no ambiente Octave
    %caminhoBibliotecaMIDI = '..\midi_Functions';


    NomeArquivo = 'test';
    arquivoPath = ['..\midiFiles\' NomeArquivo '.mid'];



    % Lê o arquivo MIDI
    midi = readmidi(arquivoPath);


    % Obtém informações sobre as notas do arquivo MIDI
    info = midiInfo(midi);

    % Frequência de amostragem e vetor de tempo
    fa = 44100;
    ta = 1/fa;

    sinal = [];



    % Baner
    titulo_menu = '  > > > Sequenciador e Sintetizador de Ficheiros MIDI < < < ';
    disp(repmat('=', 1, length(titulo_menu)));
    disp(titulo_menu);
    disp(repmat('=', 1, length(titulo_menu)));
    disp(' ');

    % Menu para escolha do tipo de onda
    escolha = Menu();

    % Loop para sintetizar o sinal para cada nota do arquivo MIDI
    for i = 1:size(info, 1)
        pitch = info(i, 3);
        inicio = info(i, 5);
        fim = info(i, 6);
        duracao = fim - inicio;

        frequencia = midi2freq(pitch);

        % Vetor de tempo para o sinal
        t = 0:ta:duracao;

        % Geração do sinal
        switch escolha
        case 1
            y = sin(2*pi*frequencia*t);
        case 2
            y = gerar_onda_triangular(frequencia, t);
        case 3
            y = gerar_onda_quadrada(frequencia, t);
        case 4
            y = gerar_onda_dente_serra(frequencia, t);
        case 5
            y = gerar_onda_estreito(frequencia, t);
        case 6
            y = gerar_onda_ruido(frequencia, t);
    end

        sinal = [sinal y];
    end

    t = 0:ta:length(sinal)*ta-ta;

    % Modulação do sinal envolvente
    ADSR = GerarADSR(t);
    sinal_sintetizado = sinal .* ADSR;

    % Plotagem do Sinal gerado
    plot(t, sinal_sintetizado);
    switch escolha
        case 1
            title('Sinal sintetizado usando uma onda Sinoidal');
            NomeArquivo_output = [ NomeArquivo '_Onda_Sinoidal'];

        case 2
            title('Sinal sintetizado usando uma onda Triangular');
            NomeArquivo_output = [ NomeArquivo '_Onda_Triangular'];
        case 3
            title('Sinal sintetizado usando uma onda Quadrada');
            NomeArquivo_output = [ NomeArquivo '_Onda_Quadrada'];
        case 4
            title('Sinal sintetizado usando uma Onda dente de serra ');
            NomeArquivo_output = [ NomeArquivo '_Onda_dente_serra'];
       case 5
            title('Sinal sintetizado usando uma onda Onda pulso estreito (Pulse train)');
            NomeArquivo_output = [ NomeArquivo '_Onda_Sinoidal'];
        case 6
            title('Sinal sintetizado usando uma onda Onda Ruido');
            NomeArquivo_output = [ NomeArquivo '_Onda_Ruido'];
    end
    xlabel('Tempo');
    ylabel('Amplitude');

    clc;
    % Baner
    titulo_menu = '  > > > Sequenciador e Sintetizador de Ficheiros MIDI < < < ';
    disp(repmat('=', 1, length(titulo_menu)));
    disp(titulo_menu);
    disp(repmat('=', 1, length(titulo_menu)));
    disp(' ');

    % Informações adicionais sobre o sinal
    duracao_total = length(sinal_sintetizado) / fa;
    frequencia_referencia = midi2freq(info(1, 3));

    disp(['Arquivo: [' NomeArquivo '.mid]']);
    disp(['  Duração total do sinal sintetizado: ' num2str(duracao_total) ' segundos']);
    disp(['  Frequência do tom de referência: ' num2str(frequencia_referencia) ' Hz']);

    % Reproduzir o som do sinal sintetizado e Salvar o sinal como um arquivo de áudio WAV
    reproduzir_salvar_sinal(sinal_sintetizado, fa, [NomeArquivo_output '_Sintetizado.wav']);

end
