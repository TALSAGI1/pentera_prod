# Hercules Docker Project

## Description
This project creates a **Docker container** that runs the following services simultaneously:  

- **Nginx** on port 80, serving a simple `Hello World` web page.  
- **OpenSSH Server** on port 22, allowing SSH access to the container.  

The project includes the following files:  

- `Dockerfile` – Defines the environment, installs required packages, and configures the services.  
- `wrapper.sh` – A script that starts both services and keeps the container alive.  
- `index.html` – A simple HTML page displayed by Nginx (`Hello World`).  

---

## How to Run

1. **Build the Docker image**
```bash
docker build -t hercules .



docker run -d -p 80:80 -p 2222:22 hercules
Ports mapping:

80 → Access Nginx via your browser

2222 → SSH access (ssh root@localhost -p 2222)

Test Nginx

Open your browser and go to:

arduino
Copy code
http://localhost
You should see the Hello World page.

Test SSH

bash
Copy code
ssh root@localhost -p 2222
If no password is configured, you may need to set one or configure SSH keys.

File Explanations
Dockerfile
Uses Ubuntu 20.04 as a base image

Installs Nginx and OpenSSH server

Copies index.html and wrapper.sh into the container

Grants execution permissions to wrapper.sh

Exposes ports 80 and 22

Runs wrapper.sh when the container starts

wrapper.sh
Starts sshd and nginx services

Keeps the container running using tail -f /dev/null

Ensures both services stay active

index.html
A simple HTML page displaying:

nginx
Copy code
Hello World
Notes
This container demonstrates how to run multiple services inside a single Docker container.

wrapper.sh can be improved by running one of the services in the foreground instead of relying on tail -f /dev/null.

markdown
Copy code
