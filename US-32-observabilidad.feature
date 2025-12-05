Feature: Observabilidad con Actuator, Prometheus y Grafana
  Como equipo de desarrollo
  Quiero exponer y visualizar métricas en tiempo real
  Para monitorear el estado de los microservicios.

  Scenario: Exposición de métricas desde los microservicios
    Given que cada microservicio tiene habilitado Spring Actuator
    When se consulta la ruta /actuator/prometheus
    Then el sistema debe devolver métricas en formato compatible con Prometheus.

  Scenario: Prometheus recolecta métricas de todos los microservicios
    Given que Prometheus está configurado con targets para IAM, Fleet y Delivery
    When Prometheus ejecuta un ciclo de scraping
    Then debe recolectar las métricas expuestas por cada microservicio
    And registrar su estado como "UP".

  Scenario: Visualización de métricas en Grafana
    Given que Grafana está conectado a la fuente de datos Prometheus
    When el usuario accede a los dashboards de IAM, Fleet y Delivery
    Then debe visualizar gráficos en tiempo real sobre latencia, uso de CPU, errores y disponibilidad.
