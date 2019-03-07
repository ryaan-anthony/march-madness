module MarchMadness
  class FinalScores < Worker
    def perform
      MarchMadness::Game.started.incomplete.each do |game|
        summary = gateway.game_summary(game.id)
        if summary.closed?
          game.update_attributes(
            complete: true,
            away_score: summary.away_points,
            home_score: summary.home_points,
            away_rank: summary.away_rank,
            home_rank: summary.home_rank,
          )
          away = "#{game.away_team}#{game.away_rank} #{game.away_score}"
          away = game.away_score > game.home_score ? "*#{away}*" : away
          home = "#{game.home_team}#{game.home_rank} #{game.home_score}"
          home = game.home_score > game.away_score ? "*#{home}*" : home
          puts "Final score #{away}, #{home}"
        end
      end
    end

    private

    def gateway
      @gateway ||= MarchMadness::SportsRadar.new
    end
  end
end