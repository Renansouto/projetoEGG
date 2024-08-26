// Configuração do ESP32
#include <Arduino.h>

void setup() {
  // Inicializa a comunicação serial pela porta USB com uma taxa de 115200 bauds
  Serial.begin(115200);

  pinMode(15, INPUT); // Configura o pino D15 (correspondente ao pino A15) como entrada analógica para o sensor ECG
  pinMode(4, INPUT);  // Configura o pino D4 como entrada para LO +
  pinMode(2, INPUT);  // Configura o pino D2 como entrada para LO -
}

void loop() {
  static unsigned long previousMillis = 0;
  const unsigned long interval = 5; // Intervalo de leitura em milissegundos

  unsigned long currentMillis = millis();
  
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    // Variáveis para armazenar os valores lidos dos sensores ECG
    int ecgValor;
    int loPositivo;
    int loNegativo;

    // Leitura dos valores dos sensores ECG e LO
    ecgValor = analogRead(15); // Leitura do sinal ECG (pino D15)
    loPositivo = digitalRead(4); // Leitura do LO + (pino D4)
    loNegativo = digitalRead(2); // Leitura do LO - (pino D2)

    // Envio dos valores pela porta serial separados por vírgula
    Serial.print(ecgValor);
    Serial.print(",");
    Serial.print(loPositivo);
    Serial.print(",");
    Serial.println(loNegativo);
  }
}
