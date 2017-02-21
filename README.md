World Wide Food Search
======================

## Description

World Wide Food Search enables you to search on various food names and food categories.

## Usage

In one terminal, run the following to start Angular:

```sh
cd search-app/frontend
npm install
ng serve
```

In another terminal, run the following to start Rails (make sure you have Bundler installed):

```sh
# make sure you have bundler installed
cd search-app/backend
bundle install
rails db:migrate
rails db:seed
rails server
```

## Testing

```sh
cd search-app/backend
bundle exec rspec
```

License
=======

See [LICENSE](https://github.com/mykoweb/search-app/blob/master/LICENSE)
