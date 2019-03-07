module MarchMadness
  class StartingSoon < Worker
    def perform
      MarchMadness::Game.pending_notification.starting_soon.each do |game|
        game.update_attributes(notified: true)
        puts "Starting soon: #{game.away_team}#{game.away_rank} vs #{game.home_team}#{game.home_rank} @ #{game.time} EST #{game.channel}"
      end
    end
  end
end