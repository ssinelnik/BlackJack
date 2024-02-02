# frozen_string_literal: true

# description:
# 1. connected all classes
# 2. has a main menu
# 3. has a start_game method

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
    { index: 1, title: "add a card", action: :add_a_card },
    { index: 2, title: "check", action: :check },
    { index: 3, title: "show cards", action: :show_cards }
  ]

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
    Cards.two_cards_draw(@new_player) # draw two start cards for player and dealer
    @new_player.bank -= 10
    puts "You create a player #{@new_player.name} with start bank #{@new_player.bank}$ and start hand (#{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit})."
    # puts "#{@new_player}: #{@new_player.name}, #{@new_player.bank}, #{@new_player.hand}" # test print for developer
    continue_or_no # ask method continue or no
  end

  def continue_or_no
    puts 'Player can accept cards and continue the game, or retake cards hand. Enter your choice' # ask user choice
    MENU_1.each { |item| puts "#{item[:index]}: #{item[:title]}" } # show MENU_1
    choice = gets.chomp.to_i # get user choice
    need_item = MENU_1.find { |item| item[:index] == choice } # find menu element by user choice
    send(need_item[:action]) # ??
    continue_the_game
  end

  def continue_the_game
    # ..
  end

  def add_a_card
    # ..
  end

  def check
    # ..
  end

  def show_cards
    # ..
  end

  def retake_cards
    @new_player.clear_hand
    Cards.two_cards_draw(@new_player)
    puts "New cards for player #{@new_player.name}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    # puts "#{@new_player.hand}"
    continue_or_no
  end

  def game 
    puts "CON #1"
    puts "-------------"
    puts "#{new_player}: #{@new_player.hand[0].card_power}#{@new_player.hand[0].card_suit}, #{@new_player.hand[1].card_power}#{@new_player.hand[1].card_suit}"
    puts "bank: #{@new_player.bank}"
    puts "bet: 10$"
    puts
    puts "table "
  end

  def quit_game
    abort "The game is over! See you soon!" # program end and print message
  end

  Game.new # create new Game class object
end