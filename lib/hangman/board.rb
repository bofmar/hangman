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

    def draw_self incorrect, word, choices
      
    end

    def update_choices
      new_choices = choices.select { |char| incorrect_letters.include?(char) ? false : correct_letters.include?(char)? false : true }
    end
  end
end