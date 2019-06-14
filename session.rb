require_relative 'game'
require_relative 'player'

class Session

  def initialize
    puts "Welcome to Tic Tac Toe"
    @players = [ create_player(:X), create_player(:O)]
    @ties = 0
    play_until_quit
    
  end

  private

  def create_player(marker)
    puts "Enter the name for Player playing with #{marker} marker:"
    print ">"
    player_name = gets.chomp.strip
    Player.new(player_name,marker)
  end
  

  def play_until_quit
    loop do
      puts "Starting a new Game"
      start_new_game
      puts display_scores
      puts "Wanna play again?(y/n)"
      print ">"
      response = gets[0]
      if response == 'n'
        break
      end
    end
    puts "Ohh leaving!! We are sad to see you leave."
  end

  def start_new_game
    game  = Game.new(@players)
    winner = game.play_until_end
    if winner
      puts "Hurray!!! Winner is #{winner.name}"
      winner.score += 1
    else
      @ties += 1
      puts "Game tied!"
    end
  end

  def display_scores
    scores_array = ["Scores after #{games_played} games"]
    scores_array.concat(@players.map {|player| "#{player.name} won #{player.score} times"})
    scores_array << "#{@players[0].name} and #{@players[1].name} tied #{@ties} times"
  
  end

  def games_played
    @ties + @players.reduce(0) {|total_score,player| total_score+player.score}
  end

end