class Word::ValidateController < ApplicationController
  def create
    flash[:result] = "Foobar"
    redirect_to root_path
  end
end
