# Projeto EEG

## Descrição

Este projeto visa simular sinais de eletroencefalograma (EEG) e realizar uma análise abrangente desses sinais, incluindo a geração de sinais, espectrogramas, histogramas e estatísticas descritivas. O projeto também inclui a capacidade de salvar esses dados em diferentes formatos para posterior análise e envio via Bluetooth para um microcontrolador, como o ESP32, e posteriormente para a nuvem via Wi-Fi.

## Funcionalidades

1. **Simulação de Sinais de EEG:**
    - Geração de sinais de EEG simulados com diferentes tipos de ondas (delta, theta, alpha, beta, gamma).
    - Inclusão de artefatos como batimentos cardíacos e piscadas oculares.
    - Adição de ruído aos sinais.

2. **Análise dos Sinais de EEG:**
    - Plotagem dos sinais gerados.
    - Criação de espectrogramas para análise de frequência.
    - Geração de histogramas das amplitudes dos sinais.
    - Cálculo de estatísticas descritivas (média, mediana, desvio padrão, mínimo, máximo).

3. **Salvamento dos Dados:**
    - Sinais de EEG em formato CSV.
    - Transformada Rápida de Fourier (FFT) dos sinais em formato CSV.
    - Histogramas em formato CSV.
    - Estatísticas descritivas em formato CSV.
    - Gráficos interativos em formato HTML.

4. **Estrutura de Pastas para Salvamento:**
    - Dados organizados em subpastas específicas (sinais, espectrogramas, histogramas, estatísticas).
    - Pasta principal nomeada conforme a pessoa (e.g., "dados_eeg_pessoa_1", "dados_eeg_pessoa_2").