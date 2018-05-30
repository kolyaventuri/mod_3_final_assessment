RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      WebMock.allow_net_connect!
      VCR.turn_off!
      FactoryBot.lint
      VCR.turn_on!
      WebMock.disable_net_connect!
    ensure
      DatabaseCleaner.clean
    end
  end
end

