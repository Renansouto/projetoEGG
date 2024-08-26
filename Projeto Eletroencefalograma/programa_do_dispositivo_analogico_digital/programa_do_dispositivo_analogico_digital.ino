  const int pinoBotao = 2; // Pino onde o botão está conectado
  int estadoBotao = 0;

  void setup() {
    Serial.begin(9600); // Inicializa a comunicação serial com baud rate de 115200
    pinMode(pinoBotao, INPUT); // Configura o pino do botão como entrada
  }

  void loop() {                                    
    estadoBotao = digitalRead(pinoBotao); // Lê o estado atual do botão (0 ou 1)
    
    Serial.println(estadoBotao); // Envia o estado do botão pela porta serial
    
    delay(100); // Pequeno atraso para evitar envio excessivo de dados
  }