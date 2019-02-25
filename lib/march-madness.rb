require 'excon'
require 'pry'
require 'mongoid'
require 'yaml'

module MarchMadness
  autoload :Client,       'march-madness/client'
  autoload :Config,       'march-madness/config'
  autoload :Game,         'march-madness/models/game'
  autoload :GameSummary,  'march-madness/models/response/game_summary'
  autoload :Response,     'march-madness/response'
  autoload :Slack,        'march-madness/services/slack'
  autoload :SportsRadar,  'march-madness/services/sports_radar'
  autoload :TodaysGames,  'march-madness/models/response/todays_games'
end

Mongoid.load!('config.yml', :mongo)