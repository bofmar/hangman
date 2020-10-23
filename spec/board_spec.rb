# ./spec/board_spec.rb
require "spec_helper.rb"

module Hangman
  RSpec.describe Board do
    
    context "#initialize" do
      it "can be initialized without any parameters and get an empty array for incorrect_letters and a 0 for number_of_incorrect_guesses. correct_letters should be returning an empty array" do
        b = Board.new
        expect(b.number_of_incorrect_guesses).to eq 0
        expect(b.incorrect_letters.length).to eq 0
        expect(b.correct_letters.length).to eq 0
      end
      it "can be passed one parameter for incorrect_letters and return return the correct values" do
        b = Board.new(["A","B","C"])
        expect(b.number_of_incorrect_guesses).to eq 3
        expect(b.incorrect_letters).to eq ["A","B","C"]
        expect(b.correct_letters).to eq []
      end
      it "by default initializes the choices array with every uppercase letter" do
        b = Board.new
        test_array = ("A".."Z").to_a
        expect(b.choices).to eq test_array
      end
      it "can be initialized with both correct and incorrect letters and return all values correctly" do
        b = Board.new(["A","B","C"], ["D","E","F"])
        expect(b.number_of_incorrect_guesses).to eq 3
        expect(b.incorrect_letters).to eq ["A","B","C"]
        expect(b.correct_letters).to eq ["D","E","F"]
        test_array = ("G".."Z").to_a
        expect(b.choices).to eq test_array
      end
    end

  end
end