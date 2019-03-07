module MarchMadness
  class ScheduledJob
    def initialize(daily = nil, always = nil)
      @daily = daily
      @always = always
      @today = nil
    end

    def run
      unless @today == today.day
        @today = today.day
        @daily&.execute
      end

      @always&.execute
    end

    def today
      Time.current.in_time_zone('Eastern Time (US & Canada)')
    end
  end
end