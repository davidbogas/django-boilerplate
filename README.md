# Django Boilerplate

My personal and very opinionated Django boilerplate for quickly starting projects. It features:

- [Django Unfold Admin Panel](https://github.com/unfoldadmin/django-unfold)
- [Django Simple History](https://github.com/jazzband/django-simple-history)
- [Django Browser Reload](https://github.com/adamchainz/django-browser-reload)
- [Django Tailwind](https://github.com/timonweb/django-tailwind) (with [FlyonUI](https://github.com/themeselection/flyonui))
- [Django Cotton](https://github.com/wrabit/django-cotton)
- [Django HTMX](https://github.com/adamchainz/django-htmx)
- [Celery](https://github.com/celery/celery) with [Redis](https://redis.io/) for background tasks
- [PostgreSQL](https://www.postgresql.org/) database
- Full Docker development environment with devcontainer support

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [VSCode](https://code.visualstudio.com/) or [Cursor](https://cursor.sh/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (recommended)

## Quick Start

### 1. Clone the repository

```bash
git clone git@github.com:davidbogas/django-boilerplate.git
cd django-boilerplate
```

### 2. Setup environment variables

Copy the example environment file and customize it:

```bash
cp .env.example .env
```

Edit the `.env` file and adjust the variables as needed for your environment.

### 3. Development with VSCode/Cursor (Recommended)

1. Open the project in VSCode or Cursor
2. When prompted, click "Reopen in Container" or use `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
3. The editor will automatically build and start the development environment

### 4. Development with Make commands

Use the included Makefile for easy development:

```bash
# Start all services
make up

# Apply migrations
make migrate

# Create a superuser
make createsuperuser

# Run tests
make test

# Open Django shell
make shell

# View all available commands
make help
```

### 5. Access the application

- **Django app**: http://localhost:8000
- **Admin panel**: http://localhost:8000/admin

## Development Commands

The project includes a Makefile with useful commands:

| Command | Description |
|---------|-------------|
| `make up` | Start all services |
| `make down` | Stop all services |
| `make build` | Build containers |
| `make restart` | Restart services |
| `make shell` | Open Django shell |
| `make bash` | Open bash in web container |
| `make makemigrations` | Create new migrations |
| `make migrate` | Apply migrations |
| `make createsuperuser` | Create Django superuser |
| `make test` | Run all tests |
| `make logs` | Show logs for all services |
| `make clean` | Remove containers and volumes |
| `make rebuild` | Clean build and restart |

## Production Deployment

### 1. Build production containers

```bash
docker compose --profile prod build
```

### 2. Start production services

```bash
docker compose --profile prod up -d
```

## Project Structure

```
├── app/                   # Django application
│   ├── config/            # Django settings and configuration
│   ├── home/              # Home app
│   ├── users/             # Custom user model
│   ├── theme/             # Tailwind CSS theme
│   └── static/            # Static files
├── compose/               # Docker configuration
├── requirements/          # Python dependencies
├── .devcontainer/         # VSCode devcontainer configuration
├── docker-compose.yml     # Docker compose configuration
├── Makefile               # Development commands
├── README.md              # This file
└── .env.example           # Environment variables example
```

