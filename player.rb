# frozen_string_literal: true

# require './cards'

class Player

  attr_accessor :bank, :name, :hand

  def initialize(name) # create a player
    @name = name
    bank = 100
    hand = []
  end

  def get_starting_cards # player make a bet
    # ..
  end

  
  
end