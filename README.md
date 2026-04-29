# Result Analyzer (Rails Application)

## Features
- Data ingestion via API
- Daily result statistics
- Monthly averages with threshold logic (>= 200 results)
- RSpec test coverage

## Setup
```bash
bundle install
rails db:create db:migrate
rails s
