# ./lib/hangman/board.rb

module Hangman
  class Board

    attr_accessor :number_of_incorrect_guesses, :incorrect_letters, :choices, :correct_letters
    def initialize incorrect_letters = [], correct_letters = []
      @incorrect_letters = incorrect_letters
      @number_of_incorrect_guesses = @incorrect_letters.length
      @correct_letters = correct_letters
      @choices = ("A".."Z").to_a
      @choices = update_choices
    end

    def draw_self game_on
      draw_hang
      draw_wrong_letters
      draw_word
      game_on ? draw_choices : draw_game_over
    end

    def update_choices
      new_choices = choices.select { |char| incorrect_letters.include?(char) ? false : correct_letters.include?(char)? false : true }
    end

    private

    def draw_hang
      if incorrect_letters.length == 0
        puts "
        -------
        |/    |
        |     
        |    
        |    
        |    
        |"
      elsif incorrect_letters.length == 1
        puts "
        -------
        |/    |
        |     0
        |     
        |     
        |    
        |"
      elsif incorrect_letters.length == 2
        puts "
        -------
        |/    |
        |     0
        |     |
        |     |
        |    
        |"
      elsif incorrect_letters.length == 3
        puts "
        -------
        |/    |
        |     0
        |    /|
        |     |
        |    
        |"
      elsif incorrect_letters.length == 4
        puts "
        -------
        |/    |
        |     0
        |    /|\\
        |     |
        |    
        |"
      elsif incorrect_letters.length == 5
        puts "
        -------
        |/    |
        |     0
        |    /|\\
        |     |
        |    / 
        |"
      else
        puts "
        -------
        |/    |
        |     0
        |    /|\\
        |     |
        |    / \\
        |"
      end
    end

    def draw_wrong_letters
      puts "Incorrect Guesses: #{incorrect_letters.join(" , ")}".colorize(:red)
    end

    def draw_word

    end

    def draw_choices
    end

    def draw_game_over
    end

  end
end