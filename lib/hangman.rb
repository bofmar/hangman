require "hangman/version"
require_relative "hangman/board.rb"
require_relative "hangman/game.rb"
require "colorize"
require "tty-prompt"

puts "test"

module Hangman
  prompt = TTY::Prompt.new
  choices = ["New Game", "Load Game"]
  puts "Welcome to Hangman!"
  choice = prompt.select("",choices)

  if choice == "New Game"
    go_on = true
    while(go_on)
      game = Game.new
      go_on = game.run
    end
  else
    game = Game.new
    game.load
  end

end
# Odin Commandments
# When game is initialized, look into the dictionary and choose a random word between 5 and 10 characters long
# Draw the hang ,the stick figure and the rest of the UI like so :
#
#
# -------
# |/    |
# |     0
# |    /|\
# |     |
# |    / \
# |
# Incorect guesses : A,C,X (letters are colored red)
# The word : _ R O G R A _ _ I N G
# Game Over
#
#
# Display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g)
# Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. # If out of guesses, the player should lose.
# Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game.
# When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved