def edit_dist(str1, str2)
  len1 = str1.length
  len2 = str2.length
  ind1 = 0
  tab = Array.new(len1 + 1) { Array.new(len2 + 1) } 
  while(ind1 <= len1)
    ind2 = 0 
    while(ind2 <= len2)
      if ind1 == 0
        tab[ind1][ind2] = ind2
      elsif ind2 == 0 
        tab[ind1][ind2] = ind1
      elsif str1[ind1 - 1] == str2[ind2 - 1]
        tab[ind1][ind2] = tab[ind1-1][ind2 - 1]
      else
        tab[ind1][ind2] = 1 + [tab[ind1][ind2-1], tab[ind1-1][ind2], tab[ind1-1][ind2-1]].min
      end
      ind2 += 1
    end
    ind1 += 1
  end
  tab[len1][len2]
end


puts edit_dist("ABCE", "ABDE")
puts edit_dist("ABC", "ABDE")
puts edit_dist("ABC", "ABD")
puts edit_dist("", "ABD")
puts edit_dist("ABC", "")
puts edit_dist("", "")
puts edit_dist("ABC", "DEF")
puts edit_dist("ABC", "ABC")

