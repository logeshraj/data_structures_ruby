# def water_storage(w)
#    max = []
#    max_so_far = 0
#    (0..(w.length - 1)).each do |i|
#        max[i] = []
#        (0..(w.length - 1)).each do |j|
#            value = ((i - j).abs - 1) * [w[i], w[j]].min
#            max[i].push(value)
#            max_so_far = value if max_so_far < value
#        end
#    end
#    max_so_far
# end



def solve(input)
  left = 0 
  right = input.length - 1
  area = 0 
  while(left < right)
    if !input[left]
      left += 1
      next
    end
    if !input[right]
      right += 1
      next
    end
    height = [input[left], input[right]].min
    width = right - 1 - left
    area = [area, (height * width)].max
    if input[left] < input[right]
      left += 1
    else
      right += 1
    end
  end
  p area
end

solve([5,2,3,4,5])