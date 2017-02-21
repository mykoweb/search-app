

```sh
npm install -g angular-cli
cd frontend
npm install ng2-pagination --save
ng serve

cd ../backend
# make sure you have bundler installed
bundle install
rails db:migrate
rails db:seed
```

## Testing

```sh
cd backend
bundle exec rspec
```

