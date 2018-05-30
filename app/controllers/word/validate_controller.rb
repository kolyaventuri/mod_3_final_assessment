class Word::ValidateController < ApplicationController
  def create
    word_lookup_result = OxfordService.lookup_word(word_params[:word])
    if word_lookup_result[:success]
    else
      flash[:result] = "'#{word_params[:word]}' is not a valid word."
    end
    redirect_to root_path
  end

  private
  def word_params
    params.permit(:word)
  end
end
