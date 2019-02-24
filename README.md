# march-madness
https://developer.sportradar.com/docs/read/basketball/NCAA_Mens_Basketball_v4

#### March madness notifications

* Install

```
gem install march-madness
```

* Configure

1. Rename `mv mongoid.yml{.sample,}` and configure your database.
2. Rename `mv secrets.yml{.sample,}` and add your sports radar API key.
3. Output today's games

```
bundle exec rake todays_games
```
