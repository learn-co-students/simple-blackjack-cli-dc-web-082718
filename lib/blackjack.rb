require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(10) + 1
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  return gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  sum = deal_card() + deal_card()
  puts "Your cards add up to #{sum}"
  return sum
end

def hit?(total)
  prompt_user()
  input = get_user_input()
  if input.downcase == "h"
    total += deal_card()
  elsif input.downcase == "s"
    # do nothing
  else
    invalid_command()
  end
  return total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome()
  sum = initial_round()
  until sum >= 21
    sum = hit?(sum)
    display_card_total(sum)
  end
  end_game(sum)
end
