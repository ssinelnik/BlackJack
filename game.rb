# frozen_string_literal: true

# description:
# 1. connected all classes
# 2. has a main menu
# 3. has a start_game method

require './dealer'
require './player'
require './cards'

class Game
  TWENTY_ONE = 21 # main game constant

  MENU_0 = [
    { index: 1, title: "start a game", action: :start_game },
    { index: 2, title: "quit the game", action: :quit_game }
  ].freeze

  MENU_1 = [
    { index: 1, title: "continue the game", action: :continue_the_game },
    { index: 2, title: "retake all cards hand", action: :retake_cards },
    { index: 3, title: "exit to main menu", action: :main_menu },
  ].freeze

  MENU_2 = [
    { index: 1, title: "hit (add a card)", action: :hit },
    { index: 2, title: "stand (pass)", action: :stand },
    { index: 3, title: "show cards", action: :show_cards },
    { index: 4, title: "make a bet", action: :make_bet }
].freeze

  def initialize() # create a game class object
    main_menu
  end

  def main_menu # deafualt method start working, when game class object was created
    loop do
      puts 'Enter your choice' # ask user choice
      MENU_0.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_0
      choice = gets.chomp.to_i # get user choice
      need_item = MENU_0.find { |item| item[:index] == choice } # find menu element by user choice
      send(need_item[:action]) # ??
      puts "Enter '0' if you want end the game" 
      break unless gets.chomp.to_i.zero? # ??
    end
  end

  def start_game # method start working, if user choice start_game
    print "The game is starting! Enter your name -> " # ask user name
    user_name = gets.chomp.to_s # get user name
    @new_player = Player.new(user_name) # create new Player class object
    @dealer = Dealer.new
    Cards.two_cards_draw(@new_player) # draw two start cards for player and dealer
    Cards.two_cards_draw(@dealer)
    @new_player.bank -= @new_player.bet
    @dealer.bank -= @dealer.bet
    puts "You create a player #{@new_player.name} with start bank #{@new_player.bank}$ and start hand (#{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit})."
    # puts "#{@new_player}: #{@new_player.name}, #{@new_player.bank}, #{@new_player.hand}" # test print for developer
    continue_or_no # ask method continue or no
  end

  def continue_or_no
    puts 'Player can accept cards and continue the game, or retake cards hand. Enter your choice:' # ask user choice
    MENU_1.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_1
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_1.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
    continue_the_game
  end

  def hit
    Cards.one_card_draw(@new_player)
    puts
    puts "CON #2"
    puts "-------------"
    puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}, #{@new_player.hand[2].card_power}#{@new_player.hand[2].card_suit}"
    puts "sum: #{@new_player.sum_three}"
    puts "bank: #{@new_player.bank}"
    puts "bet: 10$"
    puts
    
    if @dealer.sum_two < 17
      Cards.one_card_draw(@dealer)
      puts "dealer: *, *, *"
      puts "sum: *"
      puts "bank: #{@dealer.bank}"
      puts "bet: 10$"
      puts "-------------"
    else
      puts "dealer: *, *"
      puts "sum: *"
      puts "bank: #{@dealer.bank}"
      puts "bet: 10$"
      puts "-------------"
    end
    puts "#{@new_player.name}, enter your choice:"
    MENU_2.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_2
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_2.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
  end

  def stand
    # Cards.one_card_draw(@new_player)
    puts
    puts "CON #2"
    puts "-------------"
    puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    puts "sum: #{@new_player.sum_two}"
    puts "bank: #{@new_player.bank}"
    puts "bet: 10$"
    puts
    
    # if @dealer.hand[0].card_force + @dealer.hand[1].card_force < 17
    if @dealer.sum_two < 17
      # puts "dealer: *, *"
      # puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}"
      Cards.one_card_draw(@dealer)
      puts "dealer: *, *, *"
      # puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}, #{@dealer.hand[2].card_power}#{@dealer.hand[2].card_suit}"
      puts "sum: *"
      # puts "sum: #{@dealer.hand[0].card_force + @dealer.hand[1].card_force + @dealer.hand[2].card_force}"
      puts "bank: #{@dealer.bank}"
      puts "bet: 10$"
      puts "-------------"
    else
      puts "dealer: *, *"
      # puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}"
      puts "sum: *"
      # puts "sum: #{@dealer.hand[0].card_force + @dealer.hand[1].card_force}"
      puts "bank: #{@dealer.bank}"
      puts "bet: 10$"
      puts "-------------"
    end
    puts "#{@new_player.name}, enter your choice:"
    MENU_2.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_2
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_2.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
  end

  def show_cards
    puts
    puts "CON #2"
    puts "-------------"
    if @new_player.hand[2].nil? # `if` for a player
      puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
      final_sum_player = @new_player.sum_two
      puts "sum: #{final_sum_player}"
    else
      puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}, #{@new_player.hand[2].card_power}#{@new_player.hand[2].card_suit}"
      final_sum_player = @new_player.sum_three
      puts "sum: #{final_sum_player}"
    end
    puts "bank: #{@new_player.bank}"
    puts "bet: 10$"
    puts
    if @dealer.hand[2].nil? # `if` for a dealer
      puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}"
      final_sum_dealer = @dealer.sum_two
      puts "sum: #{final_sum_dealer}"
    else
      puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}, #{@dealer.hand[2].card_suit}#{@dealer.hand[2].card_power}"
      final_sum_dealer = @dealer.sum_three
      puts "sum: #{final_sum_dealer}"
    end
    puts "bank: #{@dealer.bank}"
    puts "bet: 10$"
    puts "-------------"
    puts "#{@new_player} is a winner!" if final_sum_player > final_sum_dealer
    puts "#{@dealer} is a winner!" unless final_sum_player > final_sum_dealer
    puts final_sum_dealer # test puts
    puts final_sum_player # test puts
    puts "-------------"
    puts "#{@new_player.name}, enter your choice:"
    MENU_2.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_2
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_2.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
  end

  def make_bet
    print "Enter your bet -> "
    @user_bet = gets.chomp.to_i
    @new_player.player_bet(@user_bet)
    stand
  end

  def retake_cards
    @new_player.clear_hand
    Cards.two_cards_draw(@new_player)
    Cards.two_cards_draw(@dealer)
    puts "New cards for player #{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    continue_or_no
  end

  def continue_the_game 
    puts
    puts "CON #1"
    puts "-------------"
    puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    puts "sum: #{@new_player.sum_two}"
    puts "bank: #{@new_player.bank}"
    puts "bet: 10$"
    puts
    puts "dealer: *, *"
    puts "sum: *"
    puts "bank: #{@dealer.bank}"
    puts "bet: 10$"
    puts "-------------"
    puts "#{@new_player.name}, enter your choice:"
    MENU_2.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_2
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_2.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
  end

  def quit_game
    abort "The game is over! See you soon!" # program end and print message
  end

  Game.new # create new Game class object
end