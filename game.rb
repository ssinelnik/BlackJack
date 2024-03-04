require './modules/constants'
require './dealer'
require './player'
require './cards'

class Game
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

  MENU_3 = [
    { index: 1, title: "hit (add a card)", action: :hit },
    { index: 2, title: "stand (pass)", action: :stand },
    { index: 3, title: "show cards", action: :show_cards }
  ].freeze

  MENU_4 = [
    { index: 1, title: "start a new game", action: :start_game },
    { index: 2, title: "quit the game", action: :quit_game }
  ].freeze


  def initialize()
    main_menu
  end

  def main_menu
    loop do
      puts 'Enter your choice'
      MENU_0.each { |item| puts "#{item[:index]}: #{item[:title]}" }
      choice = gets.chomp.to_i
      need_item = MENU_0.find { |item| item[:index] == choice }
      send(need_item[:action])
      puts "Enter '0' if you want end the game" 
      break unless gets.chomp.to_i.zero?
    end
  end

  def start_game 
    print "The game is starting! Enter your name -> "
    user_name = gets.chomp.to_s 
    @new_player = Player.new(user_name)
    @dealer = Dealer.new
    Cards.two_cards_draw(@new_player) 
    Cards.two_cards_draw(@dealer)
    @new_player.bank -= @new_player.bet
    @dealer.bank -= @dealer.bet 
    puts "You create a player #{@new_player.name} with start bank #{@new_player.bank}$ and start hand (#{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit})."
    continue_or_no
  end

  def continue_or_no
    puts 'Player can accept cards and continue the game, or retake cards hand. Enter your choice:' 
    MENU_1.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU_1.find { |item| item[:index] == choice }
    send(need_item[:action]) # ??
    # continue_the_game
  end

  def hit
    Cards.one_card_draw(@new_player)
    Cards.recalculate_A(@new_player)
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
      Cards.recalculate_A(@dealer)
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
    MENU_3.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i 
    need_item = MENU_3.find { |item| item[:index] == choice } 
    send(need_item[:action])
  end

  def stand
    puts
    puts "CON #2"
    puts "-------------"
    puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    puts "sum: #{@new_player.sum_two}"
    puts "bank: #{@new_player.bank}"
    puts "bet: #{@new_player.bet}"
    puts
    
    if @dealer.sum_two < 17
      Cards.one_card_draw(@dealer)
      Cards.recalculate_A(@dealer)
      puts "dealer: *, *, *"
      puts "sum: *"
      puts "bank: #{@dealer.bank}"
      puts "bet: #{@dealer.bet}"
      puts "-------------"
    else
      puts "dealer: *, *"
      puts "sum: *"
      puts "bank: #{@dealer.bank}"
      puts "bet: #{@dealer.bet}"
      puts "-------------"
    end
    puts "#{@new_player.name}, enter your choice:"
    MENU_3.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU_3.find { |item| item[:index] == choice }
    send(need_item[:action])
  end

  def show_cards
    puts
    unless @new_player.hand[2].nil?
      puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}, #{@new_player.hand[2].card_power}#{@new_player.hand[2].card_suit}"
      final_sum_player = @new_player.sum_three
      puts "sum: #{final_sum_player}"
    else
       puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
       final_sum_player = @new_player.sum_two
       puts "sum: #{final_sum_player}"
    end
    unless @dealer.hand[2].nil?
      puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}, #{@dealer.hand[2].card_suit}#{@dealer.hand[2].card_power}"
      final_sum_dealer = @dealer.sum_three
      puts "sum: #{final_sum_dealer}"
    else
      puts "dealer: #{@dealer.hand[0].card_power}#{@dealer.hand[0].card_suit}, #{@dealer.hand[1].card_power}#{@dealer.hand[1].card_suit}"
      final_sum_dealer = @dealer.sum_two
      puts "sum: #{final_sum_dealer}"
    end
    puts
    if final_sum_player > final_sum_dealer && final_sum_player < TWENTY_ONE+1
      puts "player win"
    elsif final_sum_player < final_sum_dealer && final_sum_dealer < TWENTY_ONE+1
      puts "dealer win"
    elsif final_sum_dealer > TWENTY_ONE+1
      puts "player win"
    elsif final_sum_player > TWENTY_ONE+1
      puts "dealer win"
    elsif final_sum_player == final_sum_dealer
      puts "no winner"
    end
    puts
    puts "#{@new_player.name}, enter your choice:"
    MENU_4.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU_4.find { |item| item[:index] == choice }
    send(need_item[:action])
  end

  def make_bet
    print "Enter your bet -> "
    @user_bet = gets.chomp.to_i
    @new_player.player_bet(@user_bet)
    @dealer.dealer_bet(@user_bet)
    puts
    puts "CON #1"
    puts "-------------"
    puts "#{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    puts "sum: #{@new_player.sum_two}"
    puts "bank: #{@new_player.bank}"
    puts "bet: #{@new_player.bet}$"
    puts

    puts "dealer: *, *"
    puts "sum: *"
    puts "bank: #{@dealer.bank}"
    puts "bet: #{@dealer.bet}$"
    puts "-------------"
    
    puts "#{@new_player.name}, enter your choice:"
    MENU_3.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU_3.find { |item| item[:index] == choice }
    send(need_item[:action])
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
    MENU_2.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU_2.find { |item| item[:index] == choice }
    send(need_item[:action])
  end

  def quit_game
    abort "The game is over! See you soon!"
  end

  Game.new
end