def set_zeroes(matrix)
  return [] if matrix.nil? || matrix.empty?
  row_length = matrix.length
  col_length = matrix[0].length
  col_zero = false
  i = 0
  while(i < row_length)
    j = 1
    col_zero = true if matrix[i][0] == 0
    while j < col_length
      if matrix[i][j] == 0
        matrix[i][0] = 0 
        matrix[0][j] = 0
      end
      j += 1
    end
    i+=1
  end

  i = 1
  while(i < row_length)
    j = 1  
    while(j < col_length)
      # binding.irb
      matrix[i][j] = 0 if matrix[i][0] == 0 || matrix[0][j] == 0
      j += 1
    end
    i+=1
  end

  if matrix[0][0] == 0
    j = 0 
    while(j < col_length)
      matrix[0][j] = 0
      j += 1
    end
  end

  if col_zero
    i = 0
    while(i < row_length)
      matrix[i][0] = 0
      i += 1
    end
  end
end

matrix = [
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]

set_zeroes(matrix)
print matrix