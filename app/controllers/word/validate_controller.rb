class Word::ValidateController < ApplicationController
  def create
    @word = Word.new(word_params[:word])
  end

  private
  def word_params
    params.permit(:word)
  end
end
