# frozen_string_literal: true

class Dealer

  attr_accessor :bank, :hand, :bet

  def initialize() # create a dealer
    # story_cards = {} # ??
    @bank = 100
    @hand = []
    @bet = 10
  end

  def sum_two # sum for two cards in dealer hand
    @hand[0].card_force + @hand[1].card_force
  end

  def sum_three # sum for three cards in delaer hand
    @hand[0].card_force + @hand[1].card_force + @hand[2].card_force
  end

  def clear_hand
    @hand.clear()
  end

  def dealer_bet(bet) # make a player bet
    @bank -= bet
  end
end