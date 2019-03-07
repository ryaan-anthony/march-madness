module MarchMadness
  class App < Worker
    @last_refreshed = nil

    def run
      puts :start

      unless @last_refreshed == today.day
        @last_refreshed = today.day
        MarchMadness::RefreshGames.new.perform
      end

      MarchMadness::StartingSoon.new(@output).perform
      MarchMadness::FinalScores.new(@output).perform

      puts :end
    end

    def today
      Time.current.in_time_zone('Eastern Time (US & Canada)')
    end
  end
end