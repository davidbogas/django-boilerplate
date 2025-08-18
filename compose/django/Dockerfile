FROM nikolaik/python-nodejs:python3.13-nodejs24-slim

ARG BUILD_ENV=dev
ENV BUILD_ENV=${BUILD_ENV}

ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    # Translations dependencies
    gettext \
    # PostgreSQL dependencies
    libpq-dev \
    # Cleaning up unused files
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements/ /requirements/
RUN pip install -r /requirements/${BUILD_ENV}.txt \
    && rm -rf /requirements/

# Copy scripts according to the environment
COPY ./compose/django/${BUILD_ENV}/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

COPY ./compose/django/${BUILD_ENV}/start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start

COPY ./compose/django/${BUILD_ENV}/start-celeryworker /start-celeryworker
RUN sed -i 's/\r$//g' /start-celeryworker
RUN chmod +x /start-celeryworker

COPY ./compose/django/${BUILD_ENV}/start-celerybeat /start-celerybeat
RUN sed -i 's/\r$//g' /start-celerybeat
RUN chmod +x /start-celerybeat

# Copy the application code
COPY . /app

WORKDIR /app

ENTRYPOINT ["/entrypoint"] 