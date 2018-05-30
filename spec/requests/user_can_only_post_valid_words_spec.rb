require 'rails_helper'

feature 'A user posting to /api/v1/games/:id/plays', type: :request do
  context 'with a valid word' do
    scenario 'is allowed to play' do
      user = create(:user)
      game = create(:game, player_1: user)

      post "/api/v1/games/#{game.id}/plays", params: { user_id: user.id, word: 'fox' }

      expect(response.status).to be(201)
    end
  end
end
