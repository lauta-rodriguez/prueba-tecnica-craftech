
# Diagrama de red para aplicación web en AWS

### Overview de la arquitectura

Los aspectos de mayor consideración fueron: asegurar que la arquitectura tenga buen desempeño frente a cargas variables y que provea alta disponibilidad. El diseño busca minimizar el acoplamiento entre las partes del sistema.

### Consideraciones

Primero, trabajamos sobre una región de AWS distribuida en múltiples zonas de disponibilidad (AZ) para garantizar que si ocurre una falla crítica en una región la aplicación sigue funcional. Esto se traduce en la distribución y replicación de los recursos en las diferentes AZs, lo cuál otorga al sistema una mayor tolerancia a fallos.

Utilizamos una virtual private cloud (VPC) para aislar los recursos internos y así tener control sobre lo que exponemos al internet ó end user.

### Implementación con servicios de AWS.

- **Amazon Route 53**: Servicio DNS para gestionar el tráfico.
- **Amazon CloudFront**: Mejora el tiempo de respuesta para la distribución de archivos estáticos y contenido web, intenta enviar los archivos desde la localización más cercana, si no se encuentran allí, los trae del bucket S3.
- **Amazon S3 Bucket**: Sirve para almacenar archivos a buen costo.
- **Application Load Balancer**: Es un servicio que se encarga de balancear las cargas entrantes y redirigirlas entre las instancias EC2 disponibles para asegurar que se haga una utilización de los recursos apropiada.
- **Amazon EC2**: Servicio que ofrece cómputo en la nube a través de instancias de máquinas virtuales. En ellas hosteamos las aplicaciones Frontend y Backend.
 - **Amazon EC2 Auto Scaling**: Es un servicio que ajusta automáticamente la cantidad de instancias EC2, e.g., aumenta el número de instancias frente a un pico de tráfico y libera instancias EC2 cuando el tráfico mermó.
- **Amazon RDS**: Ofrece bases de datos relacionales y la capacidad de gestionar las mismas.
- **Amazon DynamoDB**: Ofrece bases de datos NoSQL y la capacidad de gestionar las mismas.
- **API Gateway**: Un servicio que permite configurar APIs de manera sencilla, las cuáles utilizamos como medio para comunicar el Backend con los microservicios externos alojados en funciones Lambda
- **AWS Lambda**: Permite la ejecución de aplicaciones serverless.

Referencias: https://docs.aws.amazon.com/
