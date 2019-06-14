class Player

  ROW_MAP = (:A..:Z).zip(0..2).to_h

  attr_reader :marker, :name
  attr_accessor :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score  = 0

  end

  def get_move
    [get_row, get_col]
  end

  private

  def get_row
    loop do
      puts "pick a row(A/B/C)"
      print ">"
      valid_row_input = validate_row(gets)
      return valid_row_input if valid_row_input
      puts "Invalid Row Input. Please try again."
    end
    
  end

  def get_col
    loop do
      puts "pick a column(1/2/3)"
      print ">"
      valid_column_input = validate_column(gets)
      return valid_column_input if valid_column_input
      puts "Invalid Column Input. Please try again."
    end
  end

  def validate_row(row_input)
    translated_row_input = ROW_MAP[row_input[0].upcase.to_sym]
    translated_row_input if (0..2).include?(translated_row_input)
  end

  def validate_column(column_input)
    column_input = column_input.to_i - 1
    column_input if (0..2).include?(column_input)
  end

end

