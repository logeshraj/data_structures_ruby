class Matrix
  attr_accessor :grid

  def initialize(grid = nil)
    self.grid = grid
  end

  def rotate_90
    length = grid.length
    (length/2).times do |i|
      j = i
      last = length - 1
      while j< last - i do
        temp = grid[i][j]
        grid[i][j] = grid[j][last - i]
        grid[j][last - i] = grid[last-i][last-j]
        grid[last-i][last-j] = grid[last-j][i]
        grid[last-j][i] = temp
        j+=1
      end
    end
  end

  def rotate_180
  	length = grid.length
    (length/2).times do |i|
      length.times do |j|
      	temp = grid[i][j]
      	grid[i][j] = grid[length-i-1][length-j-1]
      	grid[length-i-1][length-j-1] = temp
      end
    end
  end

  def print_matrix
    grid.length.times do |i|
      grid.length.times do |j|
        print grid[i][j]
        print " "
      end
      puts "\n"
    end
  end
end


matrix = Matrix.new([
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,16]
])


matrix.print_matrix

matrix.rotate_90
# matrix.rotate_180

matrix.print_matrix