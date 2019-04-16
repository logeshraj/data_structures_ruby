def generate(num_rows)
  i = 0 
  result = []
  prev_array = [1]
  while( i < num_rows)
    result << prev_array
    current_array = []
    j = 0 
    while(j <= prev_array.length)
      if j ==0 || j == prev_array.length
        current_array[j] = 1
      else
      current_array[j] = prev_array[j-1] + prev_array[j]
      end
      j += 1
    end
    prev_array = current_array
    i += 1
  end
  result << prev_array
  result
end




[
[1],
[1,1],
[1,2,1],           1 - 0,1
[1,3,3,1],         1 - 0,1, 2-1,2
[1,4,6,4,1]        1 = 0,1 2-1,2 3-2,3
[1,5,10,10,5,1]    1-0,1 2-1,2 3-2,3 
]