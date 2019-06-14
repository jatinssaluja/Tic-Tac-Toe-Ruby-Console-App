require_relative 'board'

class Game

  def initialize(players)
    @players = players
    @board = Board.new

  end
  
  # This method allows the game to continue until the winner is found 
  # or the board is full
  def play_until_end
    current_player, other_player = @players

    until @winner || !@board.spaces_left? do
      play_turn(current_player)
      @winner = current_player if @board.winner?(current_player)
      current_player, other_player = other_player, current_player
    end
    @board.print_grid
    @winner
  end

  def play_turn(player)
    @board.print_grid
    puts "It is #{player.name}'s turn"
    loop do
      move = player.get_move
      break if @board.place_marker(*move,player.marker)
      puts "Invalid Move. Please try again."
    end
  end

end