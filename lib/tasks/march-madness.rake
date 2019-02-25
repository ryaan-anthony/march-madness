require 'march-madness'

desc 'Run the console'
task :console do
 binding.pry
end

desc 'Games starting soon'
task :starting_soon do
 MarchMadness::Game.pending_notification.starting_soon.each do |game|
  game.update_attributes(notified: true)
  slack.puts "Starting soon: #{game.away_team} vs #{game.home_team} @ #{game.time} EST #{game.channel}"
 end
end

desc 'Final scores'
task :final_scores do
 MarchMadness::Game.started.incomplete.each do |game|
  summary = MarchMadness::SportsRadar.new.game_summary(game.id)
  if summary.closed?
   game.update_attributes(
     complete: true,
     away_score: summary.away_points,
     home_score: summary.home_points,
     away_rank: summary.away_rank,
     home_rank: summary.home_rank,
   )
   slack.puts "Final score #{game.away_team}#{game.away_rank} #{game.away_score},"\
        " #{game.home_team}#{game.home_rank} #{game.home_score}"
  end
  sleep(2)
 end
end

desc 'Refresh games'
task :refresh_games do
 MarchMadness::Game.destroy_all
 MarchMadness::SportsRadar.new.todays_games.each do |game|
  MarchMadness::Game.find_or_create_by(
    id: game['id'],
    home_team: game['home']['name'],
    away_team: game['away']['name'],
    scheduled_at: DateTime.parse(game['scheduled']),
    channel: game['broadcast'].present? ? game['broadcast']['network'] : nil
  )
 end
end


def slack
 @slack ||= MarchMadness::Slack.new
end