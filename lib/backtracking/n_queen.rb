def is_safe?(row, col)
  col.times do |col_index|
    return false if @board[row][col_index] == 1
  end
  row_index = row
  col_index = col
  while(col_index >=0 && row_index >= 0)
    return false if @board[row_index][col_index] == 1
    row_index -= 1
    col_index -= 1
  end

  row_index = row
  col_index = col
  while(col_index >=0  && row_index < @board.length)
    return false if @board[row_index][col_index] == 1
    row_index += 1
    col_index -= 1
  end
  return true
end

def solve_n_queen(col)
  n = @board.length
  return true if col >= n
  row = 0 
  while row < n
    if is_safe?(row, col)
      @board[row][col] = 1
      return true if solve_n_queen(col + 1)
      @board[row][col] = 0
    end
    row += 1
  end
end

n = 20
@board = Array.new(n){ Array.new(n, 0) }
solve_n_queen(0)

@board.each do |row|
  row.each do |item|
    print "#{item} "
  end
  puts "\n"
end