def lcs(str1, str2)
  len1 = str1.length
  len2 = str2.length
  return 0 if len1 <= 0 || len2 <= 0
  return lcs(str1.chop, str2.chop) + 1 if str1[len1-1] == str2[len2-1]
  [lcs(str1.chop, str2), lcs(str1, str2.chop)].max
end

puts lcs("AGGTAB", "GXTXAYB")

puts lcs("", "GXTXAYB")

puts lcs("AGGTAB", "")

puts lcs("", "")

puts lcs("ABC", "DEF")

puts lcs("ABC", "CDE")