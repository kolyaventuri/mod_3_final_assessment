require 'rails_helper'

context 'When I make a GET request to /api/v1/games/:id' do
  let(:game_id) { 1 }
  let(:expected_json) {
    {
      "game_id" => 1,
      "scores" => [
        {
          "user_id" => 1,
          "score" => 15
        },
        {
          "user_id" => 2,
          "score" => 16
        }
      ]
    }.to_json
  }

  before(:each) do
    VCR.use_cassette('game_setup') do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)
    end
  end

  scenario 'I am returned a serialized JSON response' do
    VCR.use_cassette('game_get_endpoint') do
      get "/api/v1/games/#{game_id}"

      expect(response).to be_successful
      expect(response.body).to eq(expected_json)
    end
  end
end
