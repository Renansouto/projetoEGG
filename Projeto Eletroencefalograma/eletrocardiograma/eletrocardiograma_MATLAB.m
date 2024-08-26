% Limpa todas as variáveis
clear all;

% Variáveis (Edite conforme necessário)
PortaSerial = 'COM7'; % Porta serial onde o dispositivo ECG está conectado
IntervaloTempo = 0.6; % Intervalo de tempo entre cada leitura
LimiteSuperiorBPM = 100; % Define um limite superior para o BPM

% Configura o objeto da porta serial
s = serialport(PortaSerial, 115200);

% Inicializa variáveis de tempo e leitura do ECG
tempo = datetime('now');
leituraECG = 0;

% Inicializa variáveis para o cálculo do BPM
picos = [];
intervalos = [];
thresholdValue = 0.; % Ajuste o valor de limiar conforme necessário

% Configura a figura
Figura = figure('NumberTitle', 'off', ...
    'Name', 'Leitura em Tempo Real do ECG', ...
    'Color', [1 1 1]); % Define o fundo da figura como branco

% Configura o eixo
Eixo = axes('Parent', Figura, ...
    'YGrid', 'on', ...
    'YColor', [0 0 0], ... % Cor preta para o eixo Y
    'XGrid', 'on', ...
    'XColor', [0 0 0]); % Cor preta para o eixo X

hold on;

Grafico = plot(Eixo, tempo, leituraECG, 'Marker', '.', 'LineWidth', 1, 'Color', [1 0 0]); % Cor vermelha para o gráfico

% Cria xlabel
xlabel('Tempo', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [0 0 0]); % Texto em preto

% Cria ylabel
ylabel('Leitura do ECG', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [0 0 0]); % Texto em preto

% Cria título
title('Leitura em Tempo Real do ECG', 'FontSize', 15, 'Color', [0 0 0]); % Texto em preto

% Inicializa variáveis
leituraECG(1) = 0;
tempo(1) = datetime('now');

% Variáveis para o cálculo do BPM
totalnumberofpeaks = 0;
peaknumber = [];
HeartrateBPM = [];

% Loop infinito para leitura e plotagem em tempo real
while ishandle(Figura)
    % Lê um valor da porta serial (assumindo que os valores são números de ponto flutuante)
    data = readline(s);
    
    % Converte o dado lido para um número de ponto flutuante
    valor = str2double(data);
    
    % Verifica se o valor lido é válido (número de ponto flutuante)
    if ~isnan(valor)
        leituraECG(end+1) = valor;
        tempo(end+1) = datetime('now');
        
        % Atualiza o gráfico em tempo real
        set(Grafico, 'YData', leituraECG, 'XData', tempo);
        xlim(Eixo, [tempo(1), tempo(end)]);
        
        % Detecção de picos (adapte isso ao seu sinal de ECG)
        if valor > thresholdValue
            picos = [picos, tempo(end)]; % Registra o tempo do pico
            
            % Calcula os intervalos entre os picos
            if length(picos) > 1
                intervalo = seconds(picos(end) - picos(end-1));
                intervalos = [intervalos, intervalo];
                
                % Calcula o BPM
                bpm = 60 / intervalo; % Frequência cardíaca instantânea
                HeartrateBPM = [HeartrateBPM, bpm]; % Armazena a frequência cardíaca instantânea
                
                % Exibe o BPM no título do gráfico
                new_title = ['Leitura em Tempo Real do ECG - BPM: ' num2str(bpm)];
                title(new_title, 'FontSize', 15, 'Color', [0 0 0]); % Texto em preto
                
                % Limita o BPM máximo
                if bpm > LimiteSuperiorBPM
                    bpm = LimiteSuperiorBPM;
                end
                
                disp(['BPM: ' num2str(bpm)]); % Exibe o BPM no console
                
                % Atualiza a média da frequência cardíaca
                totalnumberofpeaks = numel(picos);
                peaknumber = [1:1:totalnumberofpeaks]';
                meanHeartrateBPM = mean(HeartrateBPM);
                
                disp(['Número de picos: ' num2str(totalnumberofpeaks)]);
                disp(['Frequência cardíaca média (BPM): ' num2str(meanHeartrateBPM)]);
            end
        end
        
        drawnow;
    else
        fprintf('Valor inválido lido: %s\n', data);
    end
    
    % Aguarda o intervalo de tempo
    pause(IntervaloTempo);
end
