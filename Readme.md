== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Initializing

### Setup Your Data Volume

The first step is to setup a data volume to use for your project. The approach used here creates
a datavolume just for this project. It will be named 'docker-rails-data' for this example, but will
use the name of your project directory if you copy bin/docker-init to your project.

```bash
  bin/docker-init
```

Once you've done this you're ready to mount the volume using samba.

### Build Your Development Container

Update the docker-compose.yml file.

```bash
  # Migrate up the database
  docker-compose up -d mysql

  # Build the dev containers
  docker-compose build
```

### Initialize Your Database

```bash
  # Migrate and seed the database
  docker-compose run --rm web bundle exec db:migrate
  docker-compose run --rm web bundle exec db:seed
```

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
