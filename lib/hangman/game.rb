# ./lib/hangman/game.rb

module Hangman
  class Game

    attr_accessor :secret_word

    def initialize
      @secret_word = choose_word
    end

    def choose_word
      contents = File.read("./lib/dictionary.txt")
      rng = Random.new
      rng = rng.rand(0..61405)
      
      contents = contents.split("\n")

      word = contents[rng]



      if word.length > 5 && word.length < 10
        return word.upcase
      else
        choose_word
      end
    end

  end
end