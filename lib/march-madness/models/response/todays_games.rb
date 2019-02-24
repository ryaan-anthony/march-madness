module MarchMadness
  class TodaysGames < Response
    def each
      body['games'].each { |result| yield result }
    end
  end
end
