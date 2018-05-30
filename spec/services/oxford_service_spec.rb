require 'rails_helper'

describe OxfordService, type: :service do
  it 'should be able to make a request to the Oxford api' do
    VCR.use_cassette('oxford_api_generic') do
      word = 'hello'

      result = OxfordService.make_request("/entries/en/#{word}")

      expect(result).to be_a Hash
      expect(result[:success]).to be_truthy
      expect(result[:results].first[:id]).to eq(word)
    end
  end

  it 'should be able to look up a single word' do
    VCR.use_cassette('oxford_api_word') do
      word = 'hello'

      result = OxfordService.lookup_word(word)

      expect(result[:success]).to be_truthy
    end
  end
end
