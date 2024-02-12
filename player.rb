# frozen_string_literal: true

# require './cards'

class Player

  attr_accessor :bank, :name, :hand, :bet

  def initialize(name) # create a player
    @name = name
    @bank = 100
    @hand = []
    @bet = 10
  end

  def sum_two # sum for two cards in player hand
    @hand[0].card_force + @hand[1].card_force
  end

  def sum_three # sum for three cards in player hand
    @hand[0].card_force + @hand[1].card_force + @hand[2].card_force
  end

  def clear_hand
    @hand.clear()
  end

  def player_bet(bet) # make a player bet
    @bank -= bet
  end
end