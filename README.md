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

## Estrutura do Projeto

projetoEGG/
- dados_eeg_pessoa_X/ # Pasta principal para cada pessoa
  - sinais/ # Sinais de EEG gerados
  - espectrogramas/ # Espectrogramas gerados
  - histogramas/ # Histogramas gerados
  - estatisticas/ # Estatísticas descritivas
  - raw_data/ # Dados brutos dos sinais
- Electrode-montage-We-used-a-standard-extension-of-the-international-10-20-system-to.png
- geração_sinal.ipynb # Jupyter notebook com o código de simulação e análise
- README.md # Descrição do projeto


## Pré-requisitos

- Python 3.11
- Bibliotecas necessárias:
  - numpy
  - mne
  - ipywidgets
  - plotly
  - matplotlib
  - pandas
  - scipy

## Instalação

1. Clone o repositório:

    ```sh
    git clone https://github.com/Renansouto/projetoEGG.git
    cd projetoEGG
    ```

2. Crie e ative um ambiente virtual:

    ```sh
    python -m venv meu_projeto_eeg
    source meu_projeto_eeg/bin/activate   # Para Linux/Mac
    meu_projeto_eeg\Scripts\activate      # Para Windows
    ```

3. Instale as dependências:

    ```sh
    pip install -r requirements.txt
    ```

## Uso

1. Abra o Jupyter Notebook:

    ```sh
    jupyter notebook
    ```

2. Navegue até `geração_sinal.ipynb` e execute as células para simular os sinais de EEG, analisar os dados e salvar os resultados.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorias, correções de bugs e novas funcionalidades.

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.
