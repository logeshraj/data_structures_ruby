NUM_HASH = {
    '2' => ['a','b','c'],
    '3' => ['d','e','f'],
    '4' => ['g','h','i'],
    '5' => ['j','k','l'],
    '6' => ['m','n','o'],
    '7' => ['p','q','r','s'],
    '8' => ['t','u','v'],
    '9' => ['w','x','y','z']
  }

def letter_combinations(digits)
  @output = []
  backtrack("", digits) unless digits.empty?
  @output
end

def backtrack(combination, digits)
  if digits.length == 0 
    @output << combination
  else
    NUM_HASH[digits[0]].each do |letter|
      backtrack(combination+letter, digits[1..digits.length-1])
    end
  end
end


print letter_combinations("2")
