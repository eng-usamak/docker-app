# README
This README provides the necessary steps to get the application up and running using Docker.

## Prerequisites
Ruby version: 2.7.2

Docker

Docker Compose

## Getting Started

1. Clone the Repository
```sh
git clone <repository-url>
cd <repository-directory>
```
2. Environment Variables

Create a .env file in the root directory with the following content:

```sh
DATABASE_USERNAME=your_db_username
DATABASE_PASSWORD=your_db_password
DATABASE_NAME=your_db_name
```

Create an .env.example file for reference:

```
sh
DATABASE_USERNAME=
DATABASE_PASSWORD=
DATABASE_NAME=
```
3. Docker Setup

3.1. Create Dockerfile

Ensure a Dockerfile is in the root directory.

3.2. Create entrypoint.sh
Create an entrypoint.sh file in the root directory and make it executable:

```
sh
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
```
```
chmod +x entrypoint.sh
```
3.3. Create docker-compose.yml

Ensure a docker-compose.yml file is in the root directory.

4. Build and Run the Application

4.1. Build the Docker Images
```sh
docker-compose build
```
4.2. Start the Application
```
docker-compose up
```
4.3. Stop the Application
```
docker-compose down
```

5. Database Setup

Run the following command to set up and migrate the database:

```
docker-compose exec app bundle exec rails db:setup db:migrate
```
6. Access the Container
To access the running container:
```
docker exec -it <container-id> bash
```

Replace <container-id> with the actual container ID of the app.