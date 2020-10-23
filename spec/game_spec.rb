# ./spec/game_spec.rb
require "spec_helper.rb"

module Hangman
  RSpec.describe Game do
    
    context "#initialize" do
      it "finds a secret word between 5 and 10 characters on initialization" do
        g = Game.new
        expect(g.secret_word.length < 10).to eq true
        expect(g.secret_word.length > 5).to eq true
      end
    end

  end
end