class Question
  attr_reader :num1, :num2, :sum


  def initialize
    @num1 = gen_num
    @num2 = gen_num
    @sum = @num1 + @num2
  end

  def gen_num
    1 + rand(20)
  end

  def get_question
    "What does #{num1} + #{num2} equal?"
  end

end

