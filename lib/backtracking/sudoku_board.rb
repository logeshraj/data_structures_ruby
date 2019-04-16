# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  valid_board?(board)
end

def valid_board?(board)
  row_length = board.length
  col_length = board[0].length
  row = 0 
  while(row< row_length)
    col = 0 
    while col < col_length
      return true if valid_row?(board, board[row][col], row, col) && 
        valid_col?(board, board[row][col], row, col) && 
          valid_box?(board, board[row][col], row, col)
      col += 1
    end
    row += 1
  end
  return false
end

def valid_row?(board, number, row_index, col_index)
  col = col_index - 1
  while(col >= 0)
    puts number
    puts board[row_index][col]
    binding.irb
    return false if number == board[row_index][col]
    col -= 1
  end
  return true
end


def valid_col?(board, number, row_index, col_index)
  row = row_index - 1
  while(row >= 0)
    return false if number == board[row][col_index]
    row -= 1
  end
  return true
end

def valid_box?(board, number, row_index, col_index)
  box_length = Math.sqrt(board.length).to_i
  row_start = row_index - (row_index % box_length)
  col_start = col_index - (col_index % box_length)
  row = row_index - 1  
  while(row >= row_start )
    col = col_index - 1
    while(col >= col_start)  
      return false if number == board[row][col]
      col -= 1
    end
    row -= 1 
  end
  return true
end

board = [
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

board1 = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

board2 = [
  ["1","2","1","1"],
  ["3","1","1","1"],
  ["1","1","2","1"],
  ["4","1","1","1"],
]
# puts is_valid_sudoku(board)
puts is_valid_sudoku(board2)