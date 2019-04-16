

def permutations(str)
  return nil if str.nil?
  all_permutations = []
  if str.length == 0
    all_permutations.push ''
    return all_permutations
  end
  first_char = str[0]
  remaining_char = str[1..str.length-1]
  words = []
  words = permutations(remaining_char)
  words.each do |word|
    [*0..word.length].each do |index|
      all_permutations.push insert_char_at(word, first_char, index)
    end
  end
  all_permutations
end


def insert_char_at(word, char, index)
  first = ''
  second = ''
  first = word[0..index-1] if index >0 
  second = word[index..word.length-1] if index <= word.length-1
  first+char+second
end


# puts permutations('abc')

puts permutations('abcdefghijk')