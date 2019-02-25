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

1. Refresh the games daily at 12pm EST
```
bundle exec rake refresh_games
```
2. Notify when games are starting every half hour between 1pm - 1am EST 
```
bundle exec rake starting_soon
```
3. Notify final scores every half hour between 1pm - 1am EST 
```
bundle exec rake final_scores
```