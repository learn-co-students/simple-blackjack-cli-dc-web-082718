def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  card_value = rand(1..11)
  return card_value
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
  # code #display_card_total here
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp
end

def end_game(card_total)
  # code #end_game here
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  # code #initial_round here
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  # code hit? here
  prompt_user
  input = get_user_input
  if(input == "s")
    return card_total
  end
  if(input == "h")
    card_total = card_total + deal_card
    return card_total
  end

  invalid_command
  hit?(card_total)
end

def invalid_command
  # code invalid_command here
  puts "That command is invalid."
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  welcome
  card_total = 0
  card_total = initial_round
  while card_total < 21
    card_total = hit?(card_total)
  end

  display_card_total(card_total)
  end_game(card_total)

end
