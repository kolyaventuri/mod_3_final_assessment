class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def scores
    [
      score_hash(player_1),
      score_hash(player_2)
    ]
  end

  private

  def score_hash(player)
    {
      user_id: player.id,
      score: plays.where(user: player).sum(:score)
    }
  end
end
