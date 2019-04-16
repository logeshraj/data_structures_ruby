class Sudoku
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def safe?(number, row, column)
    row_safe?(number, row) && column_safe?(number, column) && box_safe?(number, row, column)
  end

  def row_safe?(number, row)
    i = 0 
    while (i < self.board.length) do
      return false if self.board[row][i] == number
      i+=1
    end
    return true
  end

  def column_safe?(number, column)
    i = 0 
    while (i < self.board.length) do
      return false if self.board[i][column] == number
      i+=1
    end
    return true
  end

  def box_safe?(number, row, column)
    box_length = Math.sqrt(self.board.length)
    row_start = row - (row % box_length) 
    col_start = column - (column % box_length)
    i = row_start
    j = col_start 
    while (i < row_start + box_length) do
      while(j < col_start + box_length) do 
        return false if self.board[i][j] == number
        j+=1
      end
      i+=1
    end
    return true
  end

  def any_empty?
    row = -1
    col = -1
    empty = false
    length = self.board.length
    length.times do |i|
      length.times do |j|
        if self.board[i][j] == 0
          row = i 
          col = j
          empty = true 
          break
        end
      end
      break if empty
    end
    return -1, -1 if !empty
    return row, col if empty
  end

  def solve
    row, col = any_empty?
    return true if row == -1 && col == -1
    length = self.board.length
    length.times do |ind|
      num = ind+1
      next unless safe?(num, row, col)
      self.board[row][col] = num
      return true if self.solve
      self.board[row][col] = 0
    end
    return false
  end

  def print_board
    length = self.board.length
    length.times do |i|
      length.times do |j|
        print self.board[i][j]
        print ' '
      end
      puts "\n"
    end
  end
end

board = [
  [1,0,3,0],
  [0,0,2,1],
  [0,1,0,2],
  [2,4,0,0]
]
sb = Sudoku.new(board)
puts "Initial Board"
sb.print_board

sb.solve
puts "Solved board"
sb.print_board