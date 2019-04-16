def main
  nos = gets.chomp.to_i
  hash = {}
  nos.times do |no|
    strings = gets.chomp.split(' ')
    roll_no = strings[0].to_i
    name = strings[1]
    hash[roll_no] = name
  end

  nos = gets.chomp.to_i
  numbers = []
  nos.times do |no|
    puts hash[gets.chomp.to_i]
  end
end

main