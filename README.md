This is a simple starting point for creating a new rails backend service with MongoDB. Besides, it includes:

- A `Dockerfile` for building a container
- A `docker-compose.yml` file for setting up a development environment
- **Mongoid** installed with basic setup
- Stripped-down rails base
  - No ActiveView (no views)
  - No Active Record
  - No Active Mailer
  - No asset pipeline
  - No cookie, session or flash middleware
  - [RSpec](https://github.com/rspec/rspec-rails)
  - [Puma](https://github.com/puma/puma)
  - [RuboCop](https://github.com/bbatsov/rubocop) configuration
  - [Reek](https://github.com/troessner/reek) configuration
  - [New Relic](http://newrelic.com/) configuration
  - [Sentry](https://github.com/getsentry/sentry) initializer


{{ Project Name }}
------------------

{{ Project overview }}


### API

{{ Public API documentation }}


### Deployment

{{ Deploy requirements }}

#### Environment variables

- `DB_HOST`
- `NEW_RELIC_APP_NAME`
- `NEW_RELIC_LICENSE_KEY`
- `SENTRY_DSN`
- `SENTRY_SERVICE`
- `SENTRY_ENVIRONMENT`
- `WEB_CONCURRENCY` number of puma workers
- `MAX_THREADS` number of threads per worker
- `PORT` default: 3000
- `SECRET_KEY_BASE`


### Development

You need docker to start developing, install the docker toolbox from [this link][docker-toolbox].

The included `docker-compose.yml` file describes all containers needed to run
the application in development. The `bin/docker-run` script wraps
`docker-compose`, rebuilding the container on each run. To run the whole
application:

    ./bin/docker-run

To run the tests:

    ./bin/docker-run rspec

To run a shell inside the container:

    ./bin/docker-run bash


#### Style guidelines

Try to follow the [ruby community style guide][ruby-style], and keep your code
[clean][code-smells]. To check your code for issues, run:

    ./bin/lint

Or:

    ./bin/docker-run bin/lint

Also, you may want to install a rubocop plugin/extension for your text editor.

[docker-toolbox]: https://www.docker.com/docker-toolbox
[ruby-style]:     https://github.com/bbatsov/ruby-style-guide
[code-smells]:    https://github.com/troessner/reek/wiki/Code-Smells
