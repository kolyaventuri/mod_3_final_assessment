require 'rails_helper'

describe WordPresenter, type: :presenter do
  it 'should be able to return the stringified result of the word validation' do
    VCR.use_cassette('present_valid') do
      presenter = WordPresenter.new(Word.new('hello'))

      expect(presenter.result).to include("'hello' is a valid word")
    end
  end

  it 'should return the invalid word string' do
    VCR.use_cassette('present_invalid') do
      presenter = WordPresenter.new(Word.new('notvalid'))

      expect(presenter.result).to include('is not a valid word')
    end
  end
end
