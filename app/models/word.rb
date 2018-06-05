class Word
  attr_reader :word

  def initialize(word)
    @word = word

    check_validity
  end

  def valid?
    @valid
  end

  private

  def check_validity
    result = OxfordService.lookup_word(@word)
    @valid = result[:success]
  end
end
