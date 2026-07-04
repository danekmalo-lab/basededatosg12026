# cobtenedores de sistemas de gestores de base de datos 
![ImagenDocker](./img/imagen_docker.png)
## imagenes 
>comandos para cada imagen 

- coamndo para cada imagen 

- descargar imagen de porstgres
```
docker pull postgres:14.22-trixie
```
- Descargar imagen de tutorial de docker 
```
docker pull docker/getting-started
```
## Creacion de conttenedores
``` docker
docker run -d -p 80:80 **Nombre o codigo de la imagen**
```
Donde:
- -d detach (backgraund)
- -p puerto (el primer numero de puerto no se cambia , el segundo si podemos cambiarlo)

### contenedor de tutorial de docker 
```docker
docker run -d -p 80:8090 postgres:14.22-trixie
docker run -d -p 80:80 bbb8851608e3

### contenedor de mariaDB sin volumen
```
docker colume create columen-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:/var/lib/mysql 8763a
```


``` 
### contenedor de postgres con volumen 
```
docker volume create v-postgresg1
docker run -d --name Server-postgresg1 -p 5455:5432 -e POSTGRES-123456 -v v-postgresG1:/var/lib/postgresql/data   \
   bbb88
-e POSTGRES_PASSWORD 
```

### contenedor de SQLSERVER con volumen 
´´´Docker 
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=p@ssw0rd" \
   -u 0 \
   -p 1450:1433 --name SQLServerG1 \
   -d -v v-sqlserverg1:/var/opt/mssql/data/ \
   e07b9



v-sqlserverg1

###comandos de docker


| comando  | descripcion |
| :--- | :--- |
| **docker --Versión** | _Muestra la version de l Docker_ |
| **docker pull nombre_imagen** | _Descarga una imagen de doker Hub [Visita Google](https://hub.docker.com/)_ |
| **docker pull nombre_imagen** | _Muestra todas las imagenes_ |
| **Docker ps** | _rear un contenedor_ |
| **Docker container ls** | _visualiza los contenedores que estan en ejecucion_ |
| **Docker ps -a** | _visualiza todos lod contenedopres_ |
| **Docker container ls -a** | _visualiza todos los contenedores_ |
| **Docker rm nombre_contenedores** | _eliminna los contenedores que gustres_ |
| **Docker run** | _crea un contenedor_ |
| **Docker stop nombre o id** | _deteniene el contenedor_ |
| **Docker start nombre o id** | _inicia el contenedor_ |
| **Docker rm nombre o id** | _elimina un contenedor que no esta en ejecucion_ |
| **Docker rm -f nombre o id** | _elimina un contenedor dque no este en ejecución_ |
| **Docker volume ls** | _Mostrar los volumenes que existen en docker_ |
p@ssw@rd




