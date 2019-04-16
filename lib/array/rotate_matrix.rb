def rotate(matrix)
  rotate_90_clockwise(matrix)
end

def rotate_90_clockwise(matrix)
  mid = matrix.length/2
  length = matrix.length
  i = 0
  while(i <= mid)
    j = i
    last = length - 1
    while(j < last - i)
      # binding.irb
      temp = matrix[i][j]
      matrix[i][j] = matrix[last-j][i]
      matrix[j][i] = matrix[last-i][j]
      matrix[last-i][j] = matrix[last-j][last-i]
      matrix[last-j][i] = temp

      j += 1
    end
    i += 1
  end
  matrix
end


def print_matrix(matrix)
  height = matrix.length
  i = 0 
  while(i < height)
    width = matrix[0].length
    j = 0
    while(j < width)
      print "#{matrix[i][j]} "
      j+=1
    end
    puts ""
    i+=1
  end
end

matrix =  
      [ [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9,10,11,12],
        [13,14,15,16]]
# rotated = [[13, 9, 5, 1],
#            [14,10, 6, 2],
#            [15,11, 7, 3],
#            [16,12, 8, 4]]

rotated = rotate(matrix)

print_matrix(rotated)