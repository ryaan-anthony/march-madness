module MarchMadness
  class GameSummary < Response
    def closed?
      body['status'] == 'closed'
    end

    def home_rank
      body['home']['rank'].to_i
    end

    def home_points
      body['home']['points']
    end

    def away_rank
      body['away']['rank'].to_i
    end

    def away_points
      body['away']['points']
    end
  end
end
