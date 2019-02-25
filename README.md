# march-madness
https://developer.sportradar.com/docs/read/basketball/NCAA_Mens_Basketball_v4

#### March madness notifications (in EST)

* Install

```
gem install march-madness
```

* Configure

1. Rename `mv mongoid.yml{.sample,}` and configure your database.
2. Rename `mv secrets.yml{.sample,}` and add your sports radar API key.

* Run the commands

1. Output today's games at 9am
```
bundle exec rake todays_games
```
2. Update games every half hour between 1pm - 1am EST 
```
bundle exec rake update_games
```