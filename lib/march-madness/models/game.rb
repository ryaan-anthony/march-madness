module MarchMadness
  class Game
    include Mongoid::Document
    field :id, type: String
    field :complete, type: Boolean, default: false
    field :notified, type: Boolean, default: false
    field :away_rank, type: Integer
    field :away_score, type: Integer
    field :away_team, type: String
    field :home_rank, type: Integer
    field :home_score, type: Integer
    field :home_team, type: String
    field :channel, type: String
    field :scheduled_at, type: DateTime

    validates :id, presence: true
    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :scheduled_at, presence: true

    scope :incomplete, -> { where(complete: false) }
    scope :started, -> { where(:scheduled_at.lt => DateTime.now) }
    scope :starting_soon, -> { where(:scheduled_at.lt => DateTime.now + (2/24.0)) }
    scope :pending_notification, -> { where(notified: false) }

    def channel
      super ? "on #{super}" : nil
    end

    def time
      scheduled_at.in_time_zone('Eastern Time (US & Canada)').strftime('%l:%M%p').strip
    end

    def away_rank
      rank(super)
    end

    def home_rank
      rank(super)
    end

    private

    def rank(rank)
      rank > 0 ? "(#{rank})" : nil
    end
  end
end
