# ./lib/hangman/game.rb

module Hangman
  class Game

    attr_accessor :secret_word, :disp_word, :board, :incorrect_letters, :correct_letters

    def initialize
      @secret_word = choose_word
      @disp_word = create_displayed_word
      @incorrect_letters = []
      @correct_letters = []
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

    def check_choice choice
      if secret_word.include? choice
        correct_letters << choice
        board.correct_letters = correct_letters
        update_disp_word(choice)
      else
        incorrect_letters << choice
        board.incorrect_letters = incorrect_letters
      end
      if loss?
        board.draw_self false, false, disp_word, secret_word
      elsif win?
        board.draw_self false, true ,disp_word, secret_word
      else
        board.draw_self true, false, disp_word, secret_word
      end
    end

    def update_disp_word choice
      index = secret_word.index(choice)
      disp_word[index] = choice
    end

    def loss?
      incorrect_letters.length == 6 ? true : false
    end

    def won?
      secret_word == disp_word.join("") ? true : false
    end

  end
end