module MarchMadness
  class Game
    include Mongoid::Document
    field :complete, type: Boolean, default: false
    field :away_score, type: Integer
    field :away_team, type: String
    field :home_score, type: Integer
    field :home_team, type: String
    field :scheduled_at, type: DateTime

    validates :home_team, presence: true
    validates :away_team, presence: true
    validates :scheduled_at, presence: true
  end
end
