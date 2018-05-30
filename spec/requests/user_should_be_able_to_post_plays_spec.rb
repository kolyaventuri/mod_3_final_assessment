require 'rails_helper'

feature 'User posting to /api/v1/games/:id/plays', type: :request do
  before(:each) do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    @game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: @game, word: "sal", score: 3)
    josh.plays.create(game: @game, word: "zoo", score: 12)
    sal.plays.create(game: @game, word: "josh", score: 14)
    sal.plays.create(game: @game, word: "no", score: 2)
  end

  scenario 'should be able to create a play' do
    post "/api/v1/games/#{@game.id}/plays", params: { user_id: 1, word: 'at' }

    expect(response.status).to be(201)
  end

  xscenario 'should update the game score' do

  end
end