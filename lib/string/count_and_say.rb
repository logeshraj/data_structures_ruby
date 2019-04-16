def count_and_say(n)
  return '1' if n == 1
  i = 1
  str = '1'
  while(i < n)
    temp = ''
    count = 1
    j = 1
    while(j <= str.length)
      if str[j] == str[j-1]
        count += 1
      else
        temp += "#{count}" + str[j-1]
        count = 1
      end
      j += 1
    end
    str = temp
    i += 1
  end
  str
end

puts count_and_say(1)
puts count_and_say(2)
puts count_and_say(3)
puts count_and_say(4)
puts count_and_say(5)
puts count_and_say(6)
puts count_and_say(7)
puts count_and_say(8)
puts count_and_say(9)
puts count_and_say(10)
puts count_and_say(11)
puts count_and_say(12)
puts count_and_say(13)
puts count_and_say(14)
puts count_and_say(15)
puts count_and_say(16)
puts count_and_say(17)
puts count_and_say(18)
puts count_and_say(19)
puts count_and_say(20)
puts count_and_say(21)
puts count_and_say(22)
puts count_and_say(23)
puts count_and_say(24)
puts count_and_say(25)
puts count_and_say(26)
puts count_and_say(27)
puts count_and_say(28)
puts count_and_say(29)
puts count_and_say(30)
