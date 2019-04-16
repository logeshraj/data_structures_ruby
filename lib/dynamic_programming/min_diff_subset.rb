def min_diff_subset(array)
  len = array.length
  sum = 0
  array.each do |element|
    sum += element
  end

  tab = Array.new(len+1) { Array.new(sum+1) }

  tab.each do |row|
    row[0] = true
  end

  tab[0].each do |first_row_element|
    first_row_element = false
  end

  row = 1 
  while(row <= len)
    col = 1 
    while(col <= sum)
      tab[row][col] = tab[row-1][col]
      tab[row][col] = tab[row-1][col- array[col-1]] if array[row-1] <= col
      col += 1
    end
    row += 1
  end
end