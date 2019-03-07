require 'excon'
require 'pry'
require 'mongoid'
require 'yaml'

module MarchMadness
  autoload :Client,       'march-madness/client'
  autoload :Config,       'march-madness/config'
  autoload :FinalScores,  'march-madness/workers/final_scores'
  autoload :Game,         'march-madness/models/game'
  autoload :GameSummary,  'march-madness/models/response/game_summary'
  autoload :RefreshGames, 'march-madness/workers/refresh_games'
  autoload :Response,     'march-madness/response'
  autoload :ScheduledJob, 'march-madness/scheduled_job'
  autoload :Slack,        'march-madness/services/slack'
  autoload :SportsRadar,  'march-madness/services/sports_radar'
  autoload :TodaysGames,  'march-madness/models/response/todays_games'
  autoload :StartingSoon, 'march-madness/workers/starting_soon'
  autoload :Worker,       'march-madness/worker'
end

Mongoid.load!('config.yml', :mongo)