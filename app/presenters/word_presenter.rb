class WordPresenter

  def initialize(word)
    @word = word
  end

  def result
    if word.valid?
      "'#{word.word}' is a valid word and its root form is '#{word.root_form}'."
    else
      "'#{word.word}' is not a valid word."
    end
  end

  private

  attr_reader :word
end
