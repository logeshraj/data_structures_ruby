def generate_matrix(num)
  return nil if num.nil?
  return [] if num < 1
  matrix = Array.new(num) { Array.new(num) }
  row_start = 0
  row_end = num - 1
  col_start = 0
  col_end = num - 1
  count = 0
  while(row_start <= row_end && col_start <= col_end)
    col = col_start
    while(col<= col_end)
      matrix[row_start][col] = count += 1
      col += 1
    end
    row = row_start + 1

    while(row <= row_end)
      matrix[row][col_end] = count += 1
      row += 1
    end
    if row_start < row_end && col_start < col_end
      col = col_end - 1
      while(col >= col_start)
        matrix[row_end][col] = count += 1
        col -= 1
      end
      row = row_end - 1
      while(row > row_start)
        matrix[row][col_start] = count+=1
        row -= 1
      end
    end
    row_start += 1
    col_start += 1
    row_end -= 1
    col_end -= 1
  end
  matrix
end


mat = generate_matrix(3)
p mat