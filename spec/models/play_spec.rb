require 'rails_helper'

describe Play, type: :model do
  describe "Instantiation" do
    it 'allows valid words' do
      VCR.use_cassette('valid_play_creation') do
        play = create(:play, word: 'assess')
        expect(play).to be_valid
      end
    end

    it 'disallows invalid words' do
      VCR.use_cassette('invalid_play_creation') do
        user = create(:user)
        game = create(:game, player_1: user)
        play = Play.new(game: game, user: user, word: 'notavalidword')
        expect(play).to_not be_valid
      end
    end
  end

  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        VCR.use_cassette('play_scoring') do
          play = create(:play, word: "assess")
          expect(play.score).to eq(6)
        end
      end
    end
  end
end
