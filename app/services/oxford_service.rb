require 'json'

class OxfordService
  BASE_URL = 'https://od-api.oxforddictionaries.com/api/v1'

  def self.make_request(endpoint)
    request = build_request(endpoint)
    response = request.get
    return { sucess: false } if response.status != 200

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.build_request(endpoint)
    url = "#{BASE_URL}#{endpoint}"

    Faraday.new(url: url, headers: build_headers)
  end

  def self.build_headers
    {
      'app_id': ENV['OXFORD_APP_ID'],
      'app_key': ENV['OXFORD_API_KEY']
    }
  end
end
