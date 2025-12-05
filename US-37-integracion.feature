Feature: Integración completa entre frontend y backend
  Como usuario final
  Quiero que las vistas consuman correctamente las APIs productivas
  Para navegar sin errores en los módulos.

  Scenario: Las vistas consumen APIs productivas a través del gateway
    Given que las vistas del frontend (IAM, Fleet, Delivery) están conectadas al API Gateway en AWS
    When el usuario interactúa con cada módulo
    Then el frontend debe consumir correctamente los endpoints configurados
    And los datos deben mostrarse sin errores ni inconsistencias.

  Scenario: Flujo end-to-end validado
    Given que el usuario inicia sesión en el sistema
    When navega por las funciones de rutas, órdenes y gestión de usuarios
    Then todas las acciones deben procesarse correctamente en backend
    And el sistema debe mostrar los resultados en la interfaz sin fallas.
