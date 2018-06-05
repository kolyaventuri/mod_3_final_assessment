class Word
  attr_reader :word, :root_form

  def initialize(word)
    @word = word
    @root_form = nil

    check_validity
  end

  def valid?
    @valid
  end

  def result
    if valid?
      "'#{word}' is a valid word and its root form is '#{root_form}'."
    else
      "'#{word}' is not a valid word."
    end
  end

  private

  def check_validity
    result = OxfordService.lookup_word(@word)
    @valid = result[:success]
    if @valid
      @root_form = result[:root_form]
    end
  end
end

