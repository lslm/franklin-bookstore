# Franklin Bookstore

This repository is a starter ecommerce web application written in ruby.

### Setup

```bash
# Clone the repository
$ git clone https://github.com/lslm/franklin-bookstore

# Change directories
$ cd franklin-bookstore

# Setup the database (details for login etc are in db/seeds.rb)
$ rake db:setup

# Start the rails server
$ rails s

# Navigate to localhost:3000
open http://localhost:3000
```

### Environment Variables
 TODO

### Test
Make sure the database is running. Run `bundle exec rspec`.

### Feature
TODO

### Stack

The ruby version used is `2.5.1`, and rails version `5.2.0`, although using relatively older/newer versions shouldn't break anything.

The application uses PostgreSQL as its database, so this must be installed.

Images are uploaded to Amazon AWS S3, so an account with Amazon is needed (only
in production).

Tests are driven by `rspec`, `factory_bot` and `faker`.

