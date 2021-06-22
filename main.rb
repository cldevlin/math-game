
require './player'
require './match'
require './question'
require 'pp'


puts "sample game"
puts "-------------"
match = Match.new
# current_player = "player_one"

answer = nil

while answer != 'quit'

  q = Question.new

  if match.current_player == 1
    print "Player 1: "
  else 
    print "Player 2: "
  end
  q.ask
  answer = gets.chomp
  if answer.to_i == q.answer
    puts "Correct! 😀"
  elsif answer == 'quit'
    break
  else
    puts "Incorrect! 😥 The answer is #{answer}"
    if match.current_player == 1
      match.player_one.subtract_life
    else 
      match.player_two.subtract_life
    end
  end

  # check if there is a winner
  if match.winner?
    winner = match.player_one.lives > match.player_two.lives ? "Player 1" : 'Player 2'
    puts "The winner is #{winner} with a score of #{match.player_one.lives}/3!"
    puts "---- GAME OVER ----"
    break
  end

  match.switch_player
  match.print_scores
  puts "---- NEW TURN ----"
end


# puts q.answer


# puts "What does #{q[:first_number]} + #{q[:second_number]} equal?"