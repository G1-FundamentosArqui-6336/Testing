Feature: Alta disponibilidad del API Gateway
  Como sistema distribuido
  Quiero contar con múltiples réplicas y balanceo de carga
  Para asegurar la continuidad del servicio incluso ante fallos.

  Scenario: El gateway mantiene operación continua con múltiples réplicas
    Given que existen múltiples instancias del gateway desplegadas en Docker Compose
    And todas las instancias exponen sus health checks correctamente
    When una instancia del gateway deja de responder
    Then el sistema debe continuar enroutando tráfico mediante las instancias restantes
    And el usuario no debe percibir indisponibilidad del servicio.

  Scenario: El tráfico es balanceado mediante NGINX Reverse Proxy
    Given que el NGINX Reverse Proxy está configurado para enrutar tráfico a las réplicas del gateway
    When se envían múltiples solicitudes concurrentes al puerto 80
    Then NGINX debe distribuir las solicitudes entre las instancias disponibles
    And el gateway debe responder de manera estable sin interrupciones.
