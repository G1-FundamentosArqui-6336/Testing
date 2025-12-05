Feature: Despliegue cloud estandarizado en AWS
  Como equipo DevOps
  Quiero estandarizar el docker-compose y el pipeline CI/CD
  Para permitir despliegues consistentes en EC2.

  Scenario: Docker Compose AWS permite levantar toda la infraestructura
    Given que existe un archivo docker-compose.aws.yml estandarizado
    When se ejecuta el despliegue en la instancia EC2
    Then todos los servicios deben levantarse sin conflictos de nombres
    And Eureka y Gateway deben comunicarse correctamente mediante la red interna.

  Scenario: Pipeline CI/CD despliega automáticamente en AWS
    Given que GitHub Actions tiene configurado login en ECR y despliegue vía SSH
    When se hace push a la rama main
    Then la imagen debe publicarse en ECR
    And la instancia EC2 debe recibir la actualización y reiniciar los contenedores
    And los health checks deben pasar correctamente.
