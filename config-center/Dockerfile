[root@web01 config-center]# cat docker-compose.yml
version: "3"

services:

  mktty:
    image: dydun/config-center
    links:
        - db
    ports:
    - 6021:6021  
    command: mktty -c /etc/mktty.conf
    depends_on:
      - db
  db:
    image: postgres:9.6-alpine
    environment:
      - "POSTGRES_USER=postgres"
      - "POSTGRES_PASSWORD=admin"
    volumes:
      - config-center-db-data:/var/lib/postgresql/data
      
volumes:
  config-center-db-data:
    external: true
