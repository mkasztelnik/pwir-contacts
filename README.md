# Pwir Contacts

This is a simple application created for
[PWIR](http://artemis.wszib.edu.pl/~kaszteln/pwir)
course showing how REST API can be created na used to build rich internet
applications.

## Requirements

  - ruby 2.2.x
  - postgresql

## Running development instance

  - [install ruby 2.2.x](https://www.ruby-lang.org/pl/downloads/)
  - install bundler: `gem install bundler`
  - get `pwir-contacts` code: `git clone https://github.com/mkasztelnik/pwir-contacts.git`
  - enter to `pwir-contacts` directory and install required gems: `bundle install`
  - create postgresql database `createdb pwir-contacts`
  - run migrations `rake db:migrate`
  - start application: `rails server`

## Deploy to heroku

  TODO

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new pull request