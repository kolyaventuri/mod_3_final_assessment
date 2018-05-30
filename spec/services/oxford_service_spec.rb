require 'rails_helper'

describe OxfordService, type: :service do
  it 'should be able to make a request to the Oxford api' do
    VCR.use_cassette('oxford_api_generic') do
      word = 'hello'

      result = OxfordService.make_request("/entries/en/#{word}")

      expect(result).to be_a Hash
      binding.pry
      expect(result[:results].first[:id]).to eq(word)
    end
  end
end
