# ./lib/hangman/board.rb

module Hangman
  class Board

    attr_accessor :number_of_incorrect_guesses, :incorrect_letters, :choices, :correct_letters
    def initialize incorrect_letters = [], correct_letters = []
      @incorrect_letters = incorrect_letters
      @number_of_incorrect_guesses = @incorrect_letters.length
      @correct_letters = correct_letters
      @choices = ["SAVE"]
      @choices += ("A".."Z").to_a
      @choices = update_choices
      @prompt = TTY::Prompt.new
    end

    def draw_self game_on, won, word, secret_word
      update_choices
      draw_hang
      draw_wrong_letters
      draw_word word
      return game_on ? draw_choices : won ? draw_victory : draw_game_over(secret_word)
    end

    def update_choices
      new_choices = @choices.select { |char| incorrect_letters.include?(char) ? false : correct_letters.include?(char)? false : true }
      @choices = new_choices
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

    def draw_word word
      puts "The word: #{word.join(" ")}".colorize(:light_green)
    end

    def draw_choices
      update_choices
      choice = @prompt.select("Select a letter: ", choices)
      return choice
    end

    def draw_victory
      puts "Game Over".colorize(:light_green)
      puts "You won!".colorize(:light_green)
    end

    def draw_game_over secret_word
      puts "Game Over".colorize(:red)
      puts "The word was #{secret_word}".colorize(:red)
    end

  end
end