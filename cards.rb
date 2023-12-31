class Cards
  attr_accessor :card_number, :card_power, :card_suit, :card_owner

  # def Cards.two_card_draw(user)
  #   2.times { user.hand.push(@@cards[rand(1..52)]) }
  # end

  def initialize(card_number, card_owner, card_suit, card_power)
    @card_number = card_number
    @card_owner = card_owner
    @card_suit = card_suit
    @card_power = card_power
  end

  @@cards = [ c_1 = Cards.new(1, "nobody", "\u2665", "2"),
            c_2 = Cards.new(2, "nobody", "\u2665", "3"),
            c_3 = Cards.new(3, "nobody", "\u2665", "4"),
            c_4 = Cards.new(4, "nobody", "\u2665", "5"),
            c_5 = Cards.new(5, "nobody", "\u2665", "6"),
            c_6 = Cards.new(6, "nobody", "\u2665", "7"),
            c_7 = Cards.new(7, "nobody", "\u2665", "8"),
            c_8 = Cards.new(8, "nobody", "\u2665", "9"),
            c_9 = Cards.new(9, "nobody", "\u2665", "10"),
            c_10 = Cards.new(10, "nobody", "\u2665", "J"),
            c_11 = Cards.new(11, "nobody", "\u2665", "Q"),
            c_12 = Cards.new(12, "nobody", "\u2665", "K"),
            c_13 = Cards.new(13, "nobody", "\u2665", "A"),
            c_14 = Cards.new(14, "nobody", "\u2666", "2"),
            c_15 = Cards.new(15, "nobody", "\u2666", "3"),
            c_16 = Cards.new(16, "nobody", "\u2666", "4"),
            c_17 = Cards.new(17, "nobody", "\u2666", "5"),
            c_18 = Cards.new(18, "nobody", "\u2666", "6"),
            c_19 = Cards.new(19, "nobody", "\u2666", "7"),
            c_20 = Cards.new(20, "nobody", "\u2666", "8"),
            c_21 = Cards.new(21, "nobody", "\u2666", "9"),
            c_22 = Cards.new(22, "nobody", "\u2666", "10"),
            c_23 = Cards.new(23, "nobody", "\u2666", "J"),
            c_24 = Cards.new(24, "nobody", "\u2666", "Q"),
            c_25 = Cards.new(25, "nobody", "\u2666", "K"),
            c_26 = Cards.new(26, "nobody", "\u2666", "A"),
            c_27 = Cards.new(27, "nobody", "\u2664", "2"),
            c_28 = Cards.new(28, "nobody", "\u2664", "3"),
            c_29 = Cards.new(29, "nobody", "\u2664", "4"),
            c_30 = Cards.new(30, "nobody", "\u2664", "5"),
            c_31 = Cards.new(31, "nobody", "\u2664", "6"),
            c_32 = Cards.new(32, "nobody", "\u2664", "7"),
            c_33 = Cards.new(33, "nobody", "\u2664", "8"),
            c_34 = Cards.new(34, "nobody", "\u2664", "9"),
            c_35 = Cards.new(35, "nobody", "\u2664", "10"),
            c_36 = Cards.new(36, "nobody", "\u2664", "J"),
            c_37 = Cards.new(37, "nobody", "\u2664", "Q"),
            c_38 = Cards.new(38, "nobody", "\u2664", "K"),
            c_39 = Cards.new(39, "nobody", "\u2664", "A"),
            c_40 = Cards.new(40, "nobody", "\u2663", "2"),
            c_41 = Cards.new(41, "nobody", "\u2663", "3"),
            c_42 = Cards.new(42, "nobody", "\u2663", "4"),
            c_43 = Cards.new(43, "nobody", "\u2663", "5"),
            c_44 = Cards.new(44, "nobody", "\u2663", "6"),
            c_45 = Cards.new(45, "nobody", "\u2663", "7"),
            c_46 = Cards.new(46, "nobody", "\u2663", "8"),
            c_47 = Cards.new(47, "nobody", "\u2663", "9"),
            c_48 = Cards.new(48, "nobody", "\u2663", "10"),
            c_49 = Cards.new(49, "nobody", "\u2663", "J"),
            c_50 = Cards.new(50, "nobody", "\u2663", "Q"),
            c_51 = Cards.new(51, "nobody", "\u2663", "K"),
            c_52 = Cards.new(52, "nobody", "\u2663", "A") ]

  # cards.each { |item| puts "#{item.card_number}: #{item.card_power}#{item.card_suit}" if item.card_number == rand(1..52) }
  2.times { puts @@cards[rand(1..52)] }
end