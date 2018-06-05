require 'rails_helper'

describe Word, type: :model do
  it 'should contain a word' do
    VCR.use_cassette('word_model_valid') do
      word = Word.new('fox')

      expect(word.word).to eq('fox')
    end
  end

  it 'should validate that a word is valid' do
    VCR.use_cassette('word_model_valid') do
      word = Word.new('fox')

      expect(word).to be_valid
    end
  end

  it 'should be able to say a word is not valid' do
    VCR.use_cassette('word_model_invalid') do
      word = Word.new('foxz')

      expect(word).to_not be_valid
    end
  end
end
