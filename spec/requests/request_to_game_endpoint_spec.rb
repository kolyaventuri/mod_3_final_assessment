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

  scenario 'I am returned a serialized JSON response' do
    get "/api/v1/games/#{game_id}"

    expect(response).to be_successful
    expect(response.body).to eq(expected_json)
  end
end
