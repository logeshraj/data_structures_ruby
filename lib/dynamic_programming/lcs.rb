def lcs(str1, str2)
  return '' if str1.empty? || str2.empty?
  return str1[0] + lcs(str1[1..str1.length-1], str2[1..str2.length-1]) if str1[0] == str2[0] 
  prob1 = lcs(str1[1..str1.length-1],str2[0..str2.length-1])
  prob2 = lcs(str1[0..str1.length-1], str2[1..str2.length-1])
  return prob1 if prob1.length >= prob2.length
  prob2
end


puts lcs('abcdefg', 'xtaxbcg')