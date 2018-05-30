class Api::V1::PlaysController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    user = User.find(play_params[:user_id])

    result = game.plays.create(user: user, word: play_params[:word])
  end

  private

  def play_params
    params.permit(:user_id, :word)
  end
end
