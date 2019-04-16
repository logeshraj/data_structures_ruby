def solve(board)
  rows = board.length
  cols = board[0].length
  layer = 0 
  while(layer < (rows+1)/2)
    row = layer
    col = layer 
    while(col < cols-layer)
      board[row][col] = 'X' if layer !=0 && board[row-1][col] != 'O' && board[]
      col += 1
    end
    layer += 1
  end
end

def cover?(board, pos)
end