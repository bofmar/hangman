# ./lib/hangman/game.rb
require json

module Hangman
  class Game

    attr_accessor :secret_word, :disp_word, :board, :incorrect_letters, :correct_letters

    def initialize
      @secret_word = choose_word
      @disp_word = create_displayed_word
      @incorrect_letters = []
      @correct_letters = []
      @board = Board.new
      @prompt = TTY::Prompt.new
    end

    def run
      system "clear"
      choice = board.draw_self true, false, disp_word, secret_word
      go_on = true
      while go_on
        system "clear"
        choice = check_choice choice
        if choice == "STOP"
          go_on = false
        end

        if choice == "SAVE"
          #execute save function
          #show message
          #go on as normal
        end
      end
      gets
      system "clear"
      choice = @prompt.yes?("Would you like to go for another round?: ")
      if choice
        system "clear"
        return true
      else
        system "clear"
        puts "Thanks for playing!"
        return false
      end
    end

    private

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
      if choice == "SAVE"
        return "SAVE"
      end
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
        return "STOP"
      elsif win?
        board.draw_self false, true ,disp_word, secret_word
        return "STOP"
      else
        choice = board.draw_self true, false, disp_word, secret_word
        return choice
      end
    end

    def update_disp_word choice
      index = secret_word.index(choice)
      disp_word[index] = choice
    end

    def loss?
      incorrect_letters.length == 6 ? true : false
    end

    def win?
      secret_word == disp_word.join("") ? true : false
    end

    def reset
      @secret_word = choose_word
      @disp_word = create_displayed_word
      @incorrect_letters = []
      @correct_letters = []
      @board = Board.new
    end

    def save
      contents = { "secret_word" => @secret_word, "disp_word" => @disp_word, "incorrect_letters" => @incorrect_letters, "correct_letters" => @correct_letters }.to_json
      unless File.file?("saves")
        Dir.mkdir "saves"
      end
      puts "Select a name for your save file: "
      name = gets.chomp
      name = "saves/#{name}.json"
      File.open(name, "w") { |f| f.write(contents) }      
    end

    def load
    end

  end
end