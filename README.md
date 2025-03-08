# Django Boilerplate

My personal and very opinionated Django boilerplate for quickly starting projects. It features:

- [Django Unfold Admin Panel](https://github.com/unfoldadmin/django-unfold)
- [Django Simple History](https://github.com/jazzband/django-simple-history)
- [Django Browser Reload](https://github.com/adamchainz/django-browser-reload)
- [Django Tailwind](https://github.com/timonweb/django-tailwind) (with [FlyonUI](https://github.com/themeselection/flyonui))
- [Django Cotton](https://github.com/wrabit/django-cotton)
- [Django HTMX](https://github.com/adamchainz/django-htmx)

## Installation

### 1. Clone the repository

```bash
git clone git@github.com:davidbogas/django-boilerplate.git
```

### 2. Install system dependencies

To install docker, follow the instructions [here](https://docs.docker.com/engine/install/ubuntu/).

```bash
sudo apt-get update && sudo apt-get install -y \
python3-pip python3-venv \
postgresql postgresql-contrib \
nodejs npm
```

### 3. Install the virtual environment and dependencies

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 4. Install Tailwind dependencies

```bash
python manage.py tailwind install
```

### 5. Collect static files

```bash
python manage.py collectstatic --noinput
```

### 6. Apply migrations

```bash
python manage.py makemigrations
python manage.py migrate
```

### 7. Build the containers

```bash
docker compose build
```

### 8. Run the development server

```bash
./rundev.sh
```

or

### 9. Run the production server

```bash
python manage.py tailwind build
docker compose up -d
```

