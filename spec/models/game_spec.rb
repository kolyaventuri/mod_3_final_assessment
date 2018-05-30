require 'rails_helper'

describe Game, type: :model do
  it { is_expected.to belong_to(:player_1) }
  it { is_expected.to belong_to(:player_2) }

  it { is_expected.to have_many(:plays) }

  it 'should be able to calculate scores for all players' do
    VCR.use_cassette('score_calculation') do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      expect(game.scores).to be_an Array

      p1_score = game.scores.first
      p2_score = game.scores.second
      expect(p1_score).to be_a Hash
      expect(p2_score).to be_a Hash

      expect(p1_score[:user_id]).to be(josh.id)
      expect(p2_score[:user_id]).to be(sal.id)

      expect(p1_score[:score]).to be(15)
      expect(p2_score[:score]).to be(16)
    end
  end
end
