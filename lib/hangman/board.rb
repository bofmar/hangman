# ./lib/hangman/board.rb

module Hangman
  class Board

    attr_accessor :number_of_incorect_guesses, :incorect_letters
    def initialize incorect_letters = []
      @incorect_letters = incorect_letters
      @number_of_incorect_guesses = @incorect_letters.length
    end

    def draw_self incorect, word, choices
      
    end

    def update_choices
      
    end
  end
end