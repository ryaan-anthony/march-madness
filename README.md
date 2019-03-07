# march-madness
https://developer.sportradar.com/docs/read/basketball/NCAA_Mens_Basketball_v4

#### March madness notifications for Slack (in EST)

* Dependencies

MongoDB 3.2

* Install

```
gem install march-madness
```

* Set the following env vars

MongoDB URI:
```
MONGODB_URI=mongodb://127.0.0.1:27017/march_madness
```
Slack webhook:
```
SLACK_WEBHOOK=https://hooks.slack.com/services/xxxxxxxxx/xxxxxxxxx/xxxxxxxxx
```
Sportsradar API key:
```
SPORTSRADAR_API_KEY=xxxxxxxxx
```


* Run the commands manually

1. Refresh the games daily
```
bundle exec rake refresh_games
```
2. Notify when games are starting and final scores hourly
```
bundle exec rake report
```

* Or run in the background
```
bundle exec rake app
```

