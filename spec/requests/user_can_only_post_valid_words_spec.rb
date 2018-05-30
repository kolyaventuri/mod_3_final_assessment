require 'rails_helper'

feature 'A user posting to /api/v1/games/:id/plays', type: :request do
  context 'with a valid word' do
    scenario 'is allowed to play' do
      VCR.use_cassette('play_valid_words') do
        user = create(:user)
        game = create(:game, player_1: user)

        post "/api/v1/games/#{game.id}/plays", params: { user_id: user.id, word: 'fox' }

        expect(response.status).to be(201)
      end
    end
  end

  context 'with an invalid word' do
    scenario 'is returned an error' do
      VCR.use_cassette('play_invalid_words') do
        user = create(:user)
        game = create(:game)

        post "/api/v1/games/#{game.id}/plays", params: { user_id: user.id, word: 'notvalidword' }

        expect(response).to_not be_successful
        expect(response.status).to be(400)

        get "/api/v1/games/#{game.id}"
        game_data = JSON.parse(response.body, symbolize_names: true)

        expect(game_data[:scores].first[:score]).to be(0)
      end
    end
  end
end
