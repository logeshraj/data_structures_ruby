def permutation(str)
  return nil if str.nil?
  all_permutations = []
  if str.length == 0
    all_permutations.push ''
    return all_permutations
  end
  length = str.length
  str.length.times do |index|
    first = index > 0 ? str[0..index-1] : ''
    second = index < length-1 ? str[index+1..length] : ''
    puts "First : #{first}"
    puts "Second : #{second}"
    partials = permutation(first+second)
    partials.each do |partial|
      all_permutations.push str[index]+partial
    end
  end
  all_permutations
end

# def insert_char_at(word, char, index)
#   first = ''
#   second = ''
#   first = word[0..index-1] if index >0 
#   second = word[index..word.length-1] if index <= word.length-1
#   first+char+second
# end


# puts permutation('abc')

puts permutation('abcd')