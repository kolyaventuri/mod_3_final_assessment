class Word::ValidateController < ApplicationController
  def create
    #word_lookup_result = OxfordService.lookup_word(word_params[:word])
    #if word_lookup_result[:success]
      #flash[:result] = "'#{word_params[:word]}' is a valid word and its root form is '#{word_lookup_result[:root_form]}'."
    #else
      #flash[:result] = "'#{word_params[:word]}' is not a valid word."
    #end
    #redirect_to root_path

    @word = Word.new(word_params)
  end

  private
  def word_params
    params.permit(:word)
  end
end
