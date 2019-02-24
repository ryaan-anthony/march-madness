require 'march-madness'

desc 'Run the console'
task :console do
 binding.pry
end

desc 'Todays games'
task :todays_games do
 Rake::Task[:refresh_games].execute
 MarchMadness::Game.all.each do |game|
  game_time = game.scheduled_at.strftime('%l:%M%p').strip
  puts "#{game.away_team} vs #{game.home_team} @ #{game_time}"
 end
end

desc 'Refresh games'
task :refresh_games do
 MarchMadness::Game.destroy_all
 MarchMadness::SportsRadar.new.todays_games.each do |game|
  MarchMadness::Game.find_or_create_by(
    home_team: game['home']['name'],
    away_team: game['away']['name'],
    scheduled_at: DateTime.parse(game['scheduled']).in_time_zone('Eastern Time (US & Canada)')
  )
 end
end
