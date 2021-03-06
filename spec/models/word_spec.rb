require 'rails_helper'

describe Word, type: :model do
  it 'should contain a word' do
    VCR.use_cassette('word_model_valid') do
      word = Word.new('foxes')

      expect(word.word).to eq('foxes')
    end
  end

  it 'should validate that a word is valid' do
    VCR.use_cassette('word_model_valid') do
      word = Word.new('foxes')

      expect(word).to be_valid
    end
  end

  it 'should be able to say a word is not valid' do
    VCR.use_cassette('word_model_invalid') do
      word = Word.new('foxez')

      expect(word).to_not be_valid
    end
  end

  it 'should be able to find the root form of a word' do
    VCR.use_cassette('word_model_valid') do
      word = Word.new('foxes')

      expect(word.root_form).to eq('fox')
    end
  end
end
