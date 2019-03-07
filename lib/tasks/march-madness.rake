require 'march-madness'

desc 'Run the console'
task :console do
 binding.pry
end

desc 'Run the application'
task :app do
 loop { application.run; sleep 600 }
end

desc 'Test slack'
task :test_slack do
 slack.puts 'Test post'
end

desc 'Report on games hourly'
task :report do
 Rake::Task[:final_scores].execute
 Rake::Task[:starting_soon].execute
end

desc 'Games starting soon'
task :starting_soon do
 MarchMadness::StartingSoon.new(slack).perform
end

desc 'Final scores'
task :final_scores do
 MarchMadness::FinalScores.new(slack).perform
end

desc 'Refresh games'
task :refresh_games do
 MarchMadness::RefreshGames.new.perform
end

def application
 @application ||= MarchMadness::App.new(
   Rake::Task[:refresh_games],
   Rake::Task[:report]
 )
end

def slack
 @slack ||= MarchMadness::Slack.new
end