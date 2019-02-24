module MarchMadness
  class Game
    include Mongoid::Document
    field :id, type: String
    field :complete, type: Boolean, default: false
    field :away_rank, type: Integer
    field :away_score, type: Integer
    field :away_team, type: String
    field :home_rank, type: Integer
    field :home_score, type: Integer
    field :home_team, type: String
    field :scheduled_at, type: DateTime

    validates :id, presence: true
    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :scheduled_at, presence: true

    scope :incomplete, -> { where(complete: false) }

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
