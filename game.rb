# frozen_string_literal: true

require './dealer'
require './player/'

class Game

  MENU = [].freeze

  def initialize() # start a new game
    # ..
    cards = {
      # 1: "A^", 2: "2^", 3: "3^", 4: "4^", 5: "5^", 6: "6^", 7: "7^", 8: "8^", 9: "9^", 10: "10^", 11: "J^", 12: "Q^", 13: "K^"
      "1" => "A^", 
      "2" => "2^", 
      "3" => "3^"
    }
    start_game
  end

  def start_game
    # ..
    puts cards
  end

  Game.new
end