def is_valid(s)
  stack = []
  paren_hash = { '{' => '}', '(' => ')', '[' => ']' }
  valid = true
  s.each_char do |bracket|
    if bracket == '{' || bracket == '(' || bracket == '['
      stack << bracket
    else
      pop = stack.pop
      if !pop || paren_hash[pop] != bracket
        valid = false
        break
      end
    end
  end
  valid && stack.empty?
end


puts is_valid("()")
puts is_valid("()[]{}")
puts is_valid("(]")
puts is_valid("([)]")
puts is_valid("{[]}")
puts is_valid("(")
puts is_valid("({")
puts is_valid("((")
puts is_valid("(}")
puts is_valid("")