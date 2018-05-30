class Api::V1::GamesController < ApplicationController
  def show
    game = Game.find(params[:id])

    data = GameSerializer.new(game).serializable_hash[:data][:attributes]
    render json: data.to_json
  end
end
