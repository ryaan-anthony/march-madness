module MarchMadness
  class RefreshGames < Worker
    def perform
      MarchMadness::Game.destroy_all

      gateway.todays_games.each do |game|
        next unless DateTime.parse(game['scheduled']).future?

        summary = gateway.game_summary(game['id'])
        next unless summary.away_rank > 0 || summary.home_rank > 0

        MarchMadness::Game.find_or_create_by(
          id: game['id'],
          home_team: game['home']['name'],
          away_team: game['away']['name'],
          away_rank: summary.away_rank,
          home_rank: summary.home_rank,
          scheduled_at: DateTime.parse(game['scheduled']),
          channel: game['broadcast'].present? ? game['broadcast']['network'] : nil
        )
      end
    end

    private

    def gateway
      @gateway ||= MarchMadness::SportsRadar.new
    end
  end
end