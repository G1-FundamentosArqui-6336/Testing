Feature: Protección contra abuso mediante Rate Limiting
  Como sistema de seguridad
  Quiero limitar solicitudes excesivas
  Para proteger el Gateway contra ataques o abuso.

  Scenario: Se bloquean solicitudes excesivas
    Given que el Rate Limiter está configurado globalmente en el API Gateway
    When un cliente excede el número de solicitudes permitidas
    Then el sistema debe retornar HTTP 429 Too Many Requests
    And registrar el evento de exceso en los logs.

  Scenario: Solicitudes dentro del límite son aceptadas
    Given que el cliente envía solicitudes dentro del límite permitido
    When el gateway procesa dichas solicitudes
    Then todas deben ser aceptadas y respondidas normalmente.
