Feature: Documentación técnica actualizada con OpenAPI
  Como equipo de arquitectura
  Quiero documentar todos los endpoints de manera consistente
  Para asegurar trazabilidad y alineación entre servicios.

  Scenario: Documentación del módulo IAM está actualizada
    Given que existen endpoints para autenticación, gestión de usuarios, roles y JWKS
    When se genera la especificación OpenAPI para IAM
    Then deben incluirse los endpoints, parámetros, esquemas y ejemplos actualizados
    And la documentación debe ser consistente para consumo mediante el API Gateway.

  Scenario: Documentación de Delivery y Fleet está completa
    Given que los servicios Delivery y Fleet gestionan órdenes, rutas y conductores
    When se actualiza la especificación OpenAPI
    Then deben incluirse todos los estados, modelos de request/response y ejemplos
    And la documentación debe ser válida y exportable desde Swagger/OpenAPI.
