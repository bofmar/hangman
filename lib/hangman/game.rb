# ./lib/hangman/game.rb

module Hangman
  class Game

    attr_accessor :secret_word, :disp_word, :board

    def initialize
      @secret_word = choose_word
      @disp_word = create_displayed_word

      @board = Board.new
    end

    def choose_word
      contents = File.read("./lib/dictionary.txt")
      contents = contents.split("\n")
      
      rng = Random.new
      rng = rng.rand(0..contents.length - 1)
      

      word = contents[rng]

      if word.length > 5 && word.length < 10
        return word.upcase
      else
        choose_word
      end
    end

    def create_displayed_word
      displayed_word = secret_word.split("")
      displayed_word = displayed_word.map { |el| el = "_"}
      return displayed_word
    end

  end
end