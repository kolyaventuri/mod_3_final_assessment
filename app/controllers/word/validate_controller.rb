class Word::ValidateController < ApplicationController
  def create
    @word = Word.new(word_params[:word])
    render 'word/validate/create'
  end

  private
  def word_params
    params.permit(:word)
  end
end
