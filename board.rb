class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(3) {Array.new(3,:" ")}

  end

  def print_grid

    print generate_board_header
    letter = "A"    
    @grid.each do |row|
      puts
      print "   "<< letter
      row.each do |cell|
        print "[#{cell}]"
      end
      letter = letter.next
    end
    puts
  end
  

  def spaces_left?
    @grid.any? do |row|
      row.any? do |cell|
        cell == :" "
      end
    end
  end

  def place_marker(y,x,marker)

    if @grid[y][x] == :" " && [:X,:O].include?(marker)
      @grid[y][x] = marker
    else
      return false
    end
  end

  def winner?(player)
    marker = player.marker
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)

  end

  private

  def generate_board_header
    (1..3).reduce("   ") do |header, row_number|
      header << "  #{row_number}"
    end
  end

  def row_win?(marker)

    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)

    (0...3).any? do |column|
      @grid.all? do |row|
        row[column] == marker

      end
    end
  end

  
  def diagonal_win?(marker)
    [lambda {|i| i},lambda {|i| -(i+1)}].any? do |proc|
      (0...3).all? do |i|
        @grid[i][proc.call(i)] == marker
      end
    end
  end

  

end
