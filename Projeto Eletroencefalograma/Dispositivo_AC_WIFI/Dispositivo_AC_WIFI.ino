#include <WiFi.h>

const char* ssid = "Alunos"; // Nome da sua rede Wi-Fi
const char* password = "ifprpvai";   // Senha da sua rede Wi-Fi
const int porta = 80; // Porta para o servidor HTTP

WiFiServer server(porta);

void setup() {
  Serial.begin(9600);
  delay(10);

  // Conectar-se à rede Wi-Fi
  Serial.println();
  Serial.println();
  Serial.print("Conectando-se a ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi conectado");

  // Iniciar o servidor HTTP
  server.begin();
  Serial.println("Servidor HTTP iniciado");
}

void loop() {
  WiFiClient client = server.available();
  if (!client) {
    return;
  }

  Serial.println("Novo cliente conectado");

  // Aguardar até que o cliente envie uma solicitação HTTP
  while (!client.available()) {
    delay(1);
  }

  // Ler a solicitação HTTP
  String request = client.readStringUntil('\r');
  client.flush();

  // Se a solicitação contiver "/dados", envie dados simulados para o MATLAB
  if (request.indexOf("/dados") != -1) {
    int valorBotao = digitalRead(2); // Supondo que o botão está conectado ao pino 2
    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: text/plain");
    client.println();
    client.print(valorBotao);
    client.println();
  } else {
    // Se a solicitação não for reconhecida, envie uma resposta padrão
    client.println("HTTP/1.1 404 Not Found");
    client.println("Content-Type: text/plain");
    client.println();
    client.println("Recurso não encontrado");
  }

  delay(1);
  Serial.println("Cliente desconectado");
  Serial.println("");
}
