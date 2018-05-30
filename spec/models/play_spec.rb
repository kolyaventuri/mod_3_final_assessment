require 'rails_helper'

describe Play do
  context "Instantiation" do
    it 'allows valid words' do
      VCR.use_cassette('valid_play_creation') do
        play = create(:play, word: 'assess')
        expect(play).to be_valid
      end
    end
    it 'disallows invalid words' do
      VCR.use_cassette('invaid_play_creation') do
        play = create(:play, word: 'thisisnotavalidword')
        expect(play).to_not be_valid
      end
    end
  end

  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end
    end
  end
end
