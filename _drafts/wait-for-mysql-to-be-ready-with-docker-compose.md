---
layout: post
title: "Wait for MySQL to Be Ready with Docker Compose"
categories: development OS
tags: Docker MySQL
---

A MySQL container can be running while the database is still being initialized. If an application connects during that window, it can fail even though Compose started the database container first. This example uses a client container to reproduce the error and shows how to make Compose wait for a successful SQL query.

### **Create a Local Demo**

In a new directory, create `compose.yaml` with the following content. Run the example with Docker Compose and Linux containers.

```yaml
services:
  db:
    image: mysql:8.4
    environment:
      MYSQL_DATABASE: demo
      MYSQL_USER: app
      MYSQL_PASSWORD: demo-app
      MYSQL_ROOT_PASSWORD: demo-root
    tmpfs:
      - /var/lib/mysql
    volumes:
      - ./slow-start.sh:/docker-entrypoint-initdb.d/slow-start.sh:ro
    healthcheck:
      test:
        - CMD-SHELL
        - >-
          mysql --protocol=TCP --host=127.0.0.1 --connect-timeout=2
          --user="$${MYSQL_USER}" --password="$${MYSQL_PASSWORD}"
          --database="$${MYSQL_DATABASE}" --execute="SELECT 1"
      interval: 2s
      timeout: 3s
      start_period: 20s
      retries: 30

  app:
    image: mysql:8.4
    environment:
      MYSQL_DATABASE: demo
      MYSQL_USER: app
      MYSQL_PASSWORD: demo-app
    depends_on:
      db:
        condition: ${DB_START_CONDITION:-service_healthy}
    entrypoint: ["/bin/sh", "-ec"]
    command:
      - >-
        mysql --protocol=TCP --host=db --connect-timeout=2
        --user="$${MYSQL_USER}" --password="$${MYSQL_PASSWORD}"
        --database="$${MYSQL_DATABASE}"
        --execute="SELECT DATABASE() AS db, 1 AS ready"
```

Create `slow-start.sh` in the same directory.

```bash
#!/bin/sh
sleep 8
```

The official MySQL image runs this script while initializing a fresh database. The pause makes the startup window easy to observe. The in-memory database starts fresh on each run. The sample uses local demo credentials and publishes no ports to the host.

### **Reproduce the Connection Error**

From Bash or Zsh, start the example using `service_started` as the dependency condition.

```bash
DB_START_CONDITION=service_started docker compose up --exit-code-from app
```

Compose starts `db` first and then launches `app` while MySQL is still initializing. Look for a message such as `Can't connect to MySQL server on 'db'`. The command returns the client container's nonzero exit status and stops the demo.

### **Wait for a Successful Query**

```bash
docker compose down
DB_START_CONDITION=service_healthy docker compose up --exit-code-from app
```

This time, Compose waits for the healthcheck before starting `app`. The check uses TCP and runs `SELECT 1` against the intended database with the demo application's credentials. Using TCP also keeps the check from passing against the temporary socket-only server that MySQL uses during initialization.

Inside the healthcheck and the client command, `$$` lets the container shell expand the variables at runtime. `db` is the service name the client uses to reach MySQL over the Compose network.

Look for a row with `demo` in the `db` column and `1` in the `ready` column. The client exits successfully and Compose stops the database when the demo ends. Remove the stopped demo containers and network with `docker compose down`.

### **More Information**

- [How to connect to a Docker MySQL container]({% post_url 2024-08-28-How_to_connect_to_a_Docker_mysql_container %})
- [Control startup and shutdown order in Compose](https://docs.docker.com/compose/how-tos/startup-order/)
- [Official MySQL image](https://hub.docker.com/_/mysql)
