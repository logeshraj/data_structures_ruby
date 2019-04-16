def lcs(str1, str2)
  len1 = str1.length
  len2 = str2.length
  tab = Array.new(len1+1) { Array.new(len2+1) }
  len1_index = 0
  while(len1_index <= len1)
    len2_index = 0
    while(len2_index <= len2)
      if len1_index == 0 || len2_index == 0
        tab[len1_index][len2_index] = 0
      elsif str1[len1_index-1] == str2[len2_index-1]
        tab[len1_index][len2_index] = tab[len1_index-1][len2_index-1] + 1
      else
        tab[len1_index][len2_index] = [tab[len1_index-1][len2_index], tab[len1_index][len2_index-1]].max
      end
      len2_index += 1
    end
    len1_index += 1
  end
  tab[len1][len2]
end


puts lcs("AGGTAB", "GXTXAYB")

puts lcs("", "GXTXAYB")

puts lcs("AGGTAB", "")

puts lcs("", "")

puts lcs("ABC", "DEF")

puts lcs("ABC", "CDE")