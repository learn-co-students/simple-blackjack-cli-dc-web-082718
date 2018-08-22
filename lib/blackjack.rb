def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
   1 + rand(11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  response = gets.chomp
  return response
end

def end_game(total)
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

#spent a lot of time on def initial_round...I initially wasnt passing the card total into display_card_total...I kept trying to put "total" instead. Then I ended up putting "return card_total" above "display_card_total" because I was trying to pass the test in order, but then I realized I needed to put the return after display_card_total to get the correct item to return.
def initial_round
   card_one = deal_card
   card_two = deal_card
   card_total = deal_card + deal_card
   display_card_total(card_total)#you have to pass the total of the two cards obtained in this method and not the argument "total" from the original method
   return card_total
end


#spent a lot of time on the metod because I was again passing the wrong argument.  I was creating a new argument "selection" thinking that the hit method was running off of the users selection of h or s when its actually running based on the "card_total" from the initial round and therefore needed that argument to pass through it. Once I figured that out (had to look at someone elses example after googling questions didnt work for me), everything else fell in place.
def hit?(card_total)
  prompt_user
  selection = get_user_input
  case selection
  when "h"
    card_total += deal_card
  when "s"
    card_total
  end
  return card_total
end

def invalid_command
  puts "Please enter a valid command"
  prompt_user
  get_user_input
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  total = initial_round
until total > 21
  total = hit?(total)#new "total" needs to be updated with total from hit?method, if not the orginal total from "initial_round" will remain, causing an infinite loop (found out the hard way)
  display_card_total(total)

end
  end_game(total)
end
