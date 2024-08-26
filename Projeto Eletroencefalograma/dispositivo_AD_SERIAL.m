%% Limpa todas as variáveis
clear all;

%% Variáveis (Edite conforme necessário)
PortaSerial = 'COM7'; % Porta serial onde o dispositivo ECG está conectado
IntervaloTempo = 0.2; % Intervalo de tempo entre cada leitura

%% Configura o objeto da porta serial
s = serialport(PortaSerial,  115200);

%% Inicializa variáveis de tempo e leitura do ECG
tempo = datetime('now');
leituraECG = 0;

%% Configura a figura
Figura = figure('NumberTitle', 'off', ...
    'Name', 'Leitura em Tempo Real do ECG', ...
    'Color', [0 0 0]);

% Configura o eixo
Eixo = axes('Parent', Figura, ...
    'YGrid', 'on', ...
    'YColor', [0.9725 0.9725 0.9725], ...
    'XGrid', 'on', ...
    'XColor', [0.9725 0.9725 0.9725], ...
    'Color', [0 0 0]);

hold on;

Grafico = plot(Eixo, tempo, leituraECG, 'Marker', '.', 'LineWidth', 1, 'Color', [0 1 0]);

% Cria xlabel
xlabel('Tempo', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [1 1 0]);

% Cria ylabel
ylabel('Leitura do ECG', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [1 1 0]);

% Cria título
title('Leitura em Tempo Real do ECG', 'FontSize', 15, 'Color', [1 1 0]);

%% Inicializa variáveis
leituraECG(1) = 0;
tempo(1) = datetime('now');

%% Loop infinito para leitura e plotagem em tempo real
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
        drawnow;
    else
        fprintf('Valor inválido lido: %s\n', data);
    end
    
    % Aguarda o intervalo de tempo
    pause(IntervaloTempo);
end
