# ./spec/board_spec.rb
require "spec_helper"

module Hangman
  RSpec.describe Board do
    
    context "#initialize" do
      it."can be initialized without any parameters and get an empty array for incorect_letters and a 0 for number_of_incorect_guesses" do
        b = Board.new
        expect(b.number_of_incorect_guesses).to eq 0
        expect(b.incorect_letters.length).to eq 0
      end
    end

  end
end