Feature: Validación funcional y de seguridad de APIs productivas
  Como equipo QA
  Quiero validar que los endpoints respondan correctamente y sean seguros
  Para garantizar estabilidad en producción.

  Scenario: Los endpoints responden correctamente
    Given que las APIs IAM, Fleet y Delivery están desplegadas en cobox.duckdns.org
    When se ejecutan pruebas en Postman
    Then las respuestas deben incluir estados HTTP correctos
    And la latencia debe estar dentro de los parámetros esperados.

  Scenario: Rate Limiter funciona como medida de seguridad
    Given que el Rate Limiter está activo en el gateway
    When se envían muchas solicitudes consecutivas
    Then el sistema debe devolver HTTP 429 Too Many Requests
    And debe registrarse la cantidad de solicitudes permitidas y bloqueadas.
