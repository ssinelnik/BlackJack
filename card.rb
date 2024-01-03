class card
  attr_reader :formal_symbols, :card_power, :card_suit, :card_owner

  def initialize(formal_symbols, card_owner, card_suit)
    @formal_symbols = formal_symbols
    @card_power = card_power
    @card_suit = card_suit
  end

  def assign_owner(user)
    self.assign_owner = user
  end
end