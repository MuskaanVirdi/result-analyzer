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

## Background Jobs
- Daily statistics are processed via `DailyStatsJob` (scheduled at 6 PM)
- Monthly averages are processed via `MonthlyAveragesJob`
- Scheduling is handled using the `whenever` gem (cron-based)
