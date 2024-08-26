

% Configuração da conexão Wi-Fi
SSID = 'Alunos'; % Nome da sua rede Wi-Fi
Senha = 'ifprpvai'; % Senha da sua rede Wi-Fi

% Configura o IP e a porta para receber os dados do ESP32
ipESP = '192.168.18.29'; % IP do ESP32 na rede local
portaESP = 80; % Porta utilizada pelo servidor do ESP32

% Inicializa variáveis de tempo e estado do botão
tempo = now;
estadoBotao = 0;

% Configura a figura
Figura = figure('NumberTitle', 'off', ...
    'Name', 'Estado do Botão', ...
    'Color', [0 0 0]);

% Configura o eixo
Eixo = axes('Parent', Figura, ...
    'YGrid', 'on', ...
    'YColor', [0.9725 0.9725 0.9725], ...
    'XGrid', 'on', ...
    'XColor', [0.9725 0.9725 0.9725], ...
    'Color', [0 0 0]);

hold on;

Grafico = plot(Eixo, tempo, estadoBotao, 'Marker', '.', 'LineWidth', 1, 'Color', [0 1 0]);

% Cria xlabel
xlabel('Tempo', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [1 1 0]);

% Cria ylabel
ylabel('Estado do Botão', 'FontWeight', 'bold', 'FontSize', 14, 'Color', [1 1 0]);

% Cria título
title('Leitura em Tempo Real do Botão', 'FontSize', 15, 'Color', [1 1 0]);

% Inicializa variáveis
estadoBotao(1) = 0;
tempo(1) = now;

% Este loop while é executado indefinidamente (true), o que significa que ele continuará
% recebendo os dados e atualizando o gráfico em tempo real.
while true
    try
        % Realiza uma requisição HTTP GET para o ESP32 para obter os dados
        url = ['http://' ipESP ':' num2str(portaESP)]; % URL da requisição
        response = webread(url); % Realiza a requisição HTTP

        % Converte a resposta em um número (supondo que o ESP32 envie 0 ou 1)
        data = str2double(response);

        % Verifica se o valor está dentro dos limites esperados
        if ~isnan(data) && data >= 0 && data <= 1
            estadoBotao(end+1) = data;
            tempo(end+1) = now; % Atualiza o tempo atual

            % Atualiza o gráfico em tempo real
            set(Grafico, 'YData', estadoBotao, 'XData', tempo);
            datetick('x', 'HH:MM:SS'); % Formato de exibição do eixo x
            drawnow limitrate; % Força a atualização do gráfico imediatamente
        else
            fprintf('Valor fora dos limites esperados: %f\n', data);
        end
    catch
        % Em caso de erro na comunicação com o ESP32, continue tentando
        fprintf('Erro na requisição HTTP. Tentando novamente...\n');
    end
end
