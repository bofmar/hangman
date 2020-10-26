# Hangman

Console based hangman game. Compete against the computer to find the secret word, before you get hanged. Made with Ruby.

## Game Description

From [Wikipedia: ](https://en.wikipedia.org/wiki/Hangman_(game)) Hangman is a paper and pencil guessing game for two or more players. One player thinks of a word, phrase or sentence and the other(s) tries to guess it by suggesting letters within a certain number of guesses. 

## Rules

The game is played between the human and the pc. The pc will choose a random word which is represented by dashes equal to the word's length. The player must try to guess that word by choosing one letter each turn. If the word appears in the word, it will be added to the correct position. If not, the pc will draw a body part on the hang. If the entire body is drawn, the player is considered hanged, and he looses.

The player has the possibility at any time to save the game, which can then be loaded from the main menu.

## Installation

Clone the repo to your machine, navigate to the root folder of the app and run the following command: 

    bin/console

## Demo

![demo](https://github.com/bofmar/hangman/blob/main/hangman.gif)

## Gems Used

* [tty-prompt](https://github.com/piotrmurach/tty-prompt) : Provides a great way for getting inputs from the player.

* [colorize](https://github.com/fazibear/colorize) : Makes it easy to display different colors on the terminal

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).