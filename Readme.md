# Contribulator

[![Build Status](https://travis-ci.org/andrew/contribulator.svg?branch=master)](https://travis-ci.org/andrew/contribulator)
[![Dependency Status](https://img.shields.io/gemnasium/andrew/contribulator.svg?style=flat)](https://gemnasium.com/contribulator/contribulator)
[![Gitter chat](http://img.shields.io/badge/gitter-andrew--contribulator-brightgreen.svg?style=flat)](https://gitter.im/andrew/contribulator)

Find open source projects that are friendly to new contributors and help make your projects more friendly too.

Initially extracted from http://24pullrequests.com/projects

## Development

- Source hosted at [GitHub](http://github.com/andrew/contribulator).
- Report issues/feature requests on [GitHub Issues](http://github.com/andrew/contribulator/issues).
- Discussion and support on [Gitter](https://gitter.im/andrew/contribulator).

### Getting Started

New to Ruby? No worries! You can follow these instructions to install a local server, or you can use the included Vagrant setup.

#### Installing a Local Server

First things first, you'll need to install Ruby 2.0. I recommend using the excellent [rbenv](https://github.com/sstephenson/rbenv),
and [ruby-build](https://github.com/sstephenson/ruby-build)

```bash
rbenv install 2.2.0
rbenv global 2.2.0
```

Next, you'll need to make sure that you have PostgreSQL installed. This can be
done easily on OSX using [Homebrew](http://mxcl.github.com/homebrew/) or by using [http://postgresapp.com](http://postgresapp.com). Please see these [further instructions for installing Postgres via homebrew](http://www.mikeball.us/blog/setting-up-postgres-with-homebrew/).

```bash
brew install postgres
```

On Debian-based Linux distributions you can use apt-get to install Postgres:

```bash
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

On Windows, you can use the [Chocolatey package manager](http://www.chocolatey.org) to install Postgres:

```bash
choco install postgresql
```

Now, let's install the gems from the `Gemfile` ("Gems" are synonymous with libraries in other
languages).

```bash
gem install bundler && rbenv rehash
bundle install
```

Once all the gems are installed, we'll need to create the databases and
tables. Rails makes this easy through the use of "Rake" tasks.

```bash
bundle exec rake db:create:all
bundle exec rake db:migrate
```

And we can also add some sample data with the **seed** task

```bash
bundle exec rake db:seed
```

Almost there! Now all we have to do is start up the Rails server and point
our browser to <http://localhost:3000>

```bash
bundle exec rails s
```

### Tests

Standard RSpec tests are used for testing the application. The
tests can be run with `bundle exec rake`.

(If you find a large number of tests failing right after you've cloned the project and run migrations, try running `rake db:schema:load`. This will reload the database schema and fix any issues relating to missing tables.)

If you are using the omniauth environment variables
(GITHUB_KEY, GITHUB_SECRET)
for **another** project, you will need to either
* unset them before running your tests or
* reset the omniauth environment variables after creating a Github (omniauth) application for this project

as it will use it to learn more about the developers and for pull requests.

### Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Send a pull request. Bonus points for topic branches.

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## Contributors

Lots of different people have contributed to this project, you can see them all here: https://github.com/andrew/contribulator/graphs/contributors

## Copyright

Copyright (c) 2015 Andrew Nesbitt. See [LICENSE](https://github.com/andrew/contribulator/blob/master/LICENSE) for details.
