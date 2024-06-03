# Prueba técnica - DevOps

### ¿Cómo está estructurado el repositorio?

#### Prueba 1

En el directorio `prueba 1` se encuentra el diagrama 1 en formato `.png` y el documento asociado en formato `.md`.

#### Prueba 2

En el directorio `prueba 2` se encuentran los archivos correspondientes a la aplicación web. En cuanto a la documentación, el archivo `DEPLOYMENT.md` comprime la información necesaria para desplegar la aplicación tanto en un entorno de desarrollo como en un entorno de producción.

#### Prueba 3

En el directorio `prueba 3` se encuentra el Dockerfile necesario para construir la imagen de nginx con el archivo `index.html`.

En cuanto al pipeline CI/CD, se utiliza la plataforma ofrecida por Github: `Actions`. El archivo `.github/workflows/deploy.yml` contiene el pipeline que se ejecuta cada vez que se modifica el archivo `index.html` y se realiza un `push` al repositorio.

Pueden observarse los resultados del workflow en la pestaña `Actions` del repositorio.
