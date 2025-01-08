require 'sinatra'

before do
  # before we process a route:
  #   set the response as plain text
  #   set up an array of variable moves that the player (and computer) can perform
  content_type :txt
  @defeat = {
        rock: :scissors,
       paper: :rock,
    scissors: :paper
  }

  @throws = @defeat.keys
end

get '/throw/:type' do
  player_throw = params[:type].to_sym

  if !@throws.include?(player_throw)
    halt 403, "Yup must throw one of the following: #{throw}"
  end

  computer_throw = @throws.sample

  if player_throw == computer_throw
    "You tied with the computer. Try again!"
  elsif computer_throw == @defeat[player_throw]
    "Woohoo! #{player_throw} beats #{computer_throw}"
  else
    "Ope, #{computer_throw} beats #{player_throw}. Better luck next time!"
  end
end

