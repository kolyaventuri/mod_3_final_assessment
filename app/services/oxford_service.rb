require 'json'

class OxfordService
  BASE_URL = 'https://od-api.oxforddictionaries.com/api/v1'

  def self.make_request(endpoint)
    request = build_request(endpoint)
    response = request.get do |req|
      build_headers(req)
    end

    return { success: false } if response.status != 200

    data = JSON.parse(response.body, symbolize_names: true)
    data[:success] = true
    data[:root_form] = root_form(data)
    data
  end

  def self.lookup_word(word)
    make_request("/inflections/en/#{word}")
  end

  private
  def self.build_request(endpoint)
    url = "#{BASE_URL}#{endpoint}"

    Faraday.new(url: url)
  end

  def self.build_headers(req)
    req.headers['app_id'] = ENV['OXFORD_APP_ID']
    req.headers['app_key'] = ENV['OXFORD_API_KEY']
  end

  def self.root_form(data)
    if data[:results].first[:lexicalEntries].first[:inflectionOf]
      data[:results].first[:lexicalEntries].first[:inflectionOf].first[:text]
    end
  end
end
