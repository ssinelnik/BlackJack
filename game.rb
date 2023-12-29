# frozen_string_literal: true

require './dealer'
require './player/'

class Game

  MENU = [
    {index: 1, title: "show player bank", action: :show_player_bank }
  ].freeze

  def initialize() # start a new game
    # ..
    @cards = {
      "1": "A^", "2": "2^", "3": "3^", "4": "4^", "5": "5^", "6": "6^", "7": "7^", "8": "8^", "9": "9^", "10": "10^", "11": "J^", "12": "Q^", "13": "K^", # spades
      "14": "A+", "15": "2+", "16": "3+", "17": "4+", "18": "5+", "19": "6+", "20": "7+", "21": "8+", "22": "9+", "23": "10+", "24": "J+", "25": "Q+", "26": "K+", # crosses
      "27": "A<>", "28": "2<>", "29": "3<>", "30": "4<>", "31": "5<>", "32": "6<>", "33": "7<>", "34": "8<>", "35": "9<>", "36": "10<>", "37": "J<>", "38": "Q<>", "39": "K<>", # diamonds
      "40": "A<3", "41": "2<3", "42": "3<3", "43": "4<3", "44": "5<3", "45": "6<3", "46": "7<3", "47": "8<3", "48": "9<3", "49": "10<3", "50": "J<3", "51": "Q<3", "52": "K<3" # hearts
    }
    start_game
  end

  def start_game # ui
    loop do
      puts 'Enter your choice'
      MENU.each { |item| puts "#{item[:index]}: #{item[:title]}" }
      choice = gets.chomp.to_i
      need_item = MENU.find { |item| item[:index] == choice }
      send(need_item[:action])
      puts "Enter '0' if you want с a game"
      break unless gets.chomp.to_i.zero?
    end
  end

  def show_cards # show all 52 cards
    @cards.each do |number, suit|
      puts "#{number}: #{suit}"
    end
  end

  def random_cards # give one random card
    puts @cards[rand(@cards.values.size)]
  end

  def show_player_bank
    puts "100"
  end

  Game.new
end