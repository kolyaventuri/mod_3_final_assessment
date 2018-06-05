require 'json'

class OxfordService
  BASE_URL = 'https://od-api.oxforddictionaries.com/api/v1'

  def make_request(endpoint)
    request = build_request
    response = request.get do |req|
      req.url endpoint
      req.headers = build_headers
    end

    return { success: false } if response.status != 200

    parse_response(response.body)
  end

  def self.lookup_word(word)
    new.make_request("/api/v1/inflections/en/#{word}")
  end

  private
  def build_request
    Faraday.new(url: BASE_URL)
  end

  def build_headers
    {
      'app_id' => ENV['OXFORD_APP_ID'],
      'app_key' => ENV['OXFORD_API_KEY']
    }
  end

  def parse_response(body)
    data = JSON.parse(body, symbolize_names: true)
    data[:success] = true
    data[:root_form] = root_form(data)
    data
  end

  def root_form(data)
    if data[:results].first[:lexicalEntries].first[:inflectionOf]
      data[:results].first[:lexicalEntries].first[:inflectionOf].first[:text]
    end
  end
end
