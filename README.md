docker-h2
=========

Dockerized H2 database service.

## Running

Get the image:

```
docker pull dockerregistry.pagero.local/h2
```

Run as a service, exposing ports 1521 (TCP database server) and 81 (web interface) and mapping DATA_DIR to host:

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=MyH2Instance dockerregistry.pagero.local/
```

See the logs while running:

```
docker logs -f MyH2Instance
```
