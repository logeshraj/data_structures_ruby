def sum_bit_differences(array)
  sum = 0
  [*0..31].each do |i|
    count_1s = 0
    array.each do |num|
      if(num & (1<<i) == 0)
        count_1s+=1
      end
    end
    sum += (count_1s*(array.length-count_1s)*2)
  end
  return sum
end


puts "#{sum_bit_differences([1,3,6])}"