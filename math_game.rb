require_relative 'player'
require_relative 'question'
require_relative 'round'

class MathGame
  attr_accessor :player1, :player2, :currentPlayer

  def initialize
    @player1 = Player.new("Player 1")
    @player1.active = true
    @player2 = Player.new("Player 2")
    @currentPlayer = @player1
  end

  def play
    while (player1.is_alive? && player2.is_alive?)
      puts "---- NEW TURN ----"
      @new_question = Question.new
      puts "#{currentPlayer.name}: #{@new_question.get_question}"
      puts ">"
      answer = gets.chomp
      prompt(answer)
      change_player
    end
    puts "#{currentPlayer.name} wins with a score of #{currentPlayer.life}/3"
    puts "---- GAME OVER ----"
  end

  def change_player
    if currentPlayer == player1
      @currentPlayer = player2
    elsif (currentPlayer == player2)
      @currentPlayer = player1
    else
      "error"
    end
  end

  def prompt(number)
    if number.to_i == @new_question.sum.to_i
      puts "Congrats! You don't lose a life!"
      puts "Lives #{currentPlayer.life}/3"
    else
      currentPlayer.life -= 1
      puts "Wrongo! You lose a life!"
      puts "Lives #{currentPlayer.life}/3"
    end
  end
end
