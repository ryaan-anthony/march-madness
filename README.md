# march-madness
https://developer.sportradar.com/docs/read/basketball/NCAA_Mens_Basketball_v4

#### March madness notifications for Slack (in EST)

* Dependencies

MongoDB 3.2

* Install

```
gem install march-madness
```

* Configure

Rename `mv config.yml{.sample,}` and configure your database, add your sports radar API key, and slack webhook path.

* Run the commands

1. Output today's games at 9am
```
bundle exec rake todays_games
```
2. Update games every half hour between 1pm - 1am EST 
```
bundle exec rake update_games
```