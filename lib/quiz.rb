class Quiz
  attr_reader :score, :questions

  def initialize(questions, answers)
    @questions = questions
    @answers = answers

    @iteration ||= 0
    @score ||= 0
  end

  def current_question
    @iteration += 1
    @questions[@iteration - 1]
  end

  def finished?
    @iteration >= @questions.size
  end

  def check_input(input)
    @score += 1 if input == @answers[@iteration - 1].downcase
  end
end
