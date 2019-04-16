@lcs_dp = {}

def lcs(str1, str2)
  return @lcs_dp["#{str1}-#{str2}"] if @lcs_dp["#{str1}-#{str2}"] != nil
  if str1.empty? || str2.empty?
    @lcs_dp["#{str1}-#{str2}"] = ''
    return @lcs_dp["#{str1}-#{str2}"]
  end
  if str1[0] == str2[0] 
    prob = lcs(str1[1..str1.length-1], str2[1..str2.length-1])
    @lcs_dp["#{str1}-#{str2}"] = str1[0] + prob
    return @lcs_dp["#{str1}-#{str2}"] 
  end
  prob1 = lcs(str1[1..str1.length-1],str2[0..str2.length-1])
  prob2 = lcs(str1[0..str1.length-1], str2[1..str2.length-1])
  if prob1.length >= prob2.length
    @lcs_dp["#{str1}-#{str2}"] = prob1
    return prob1
  end
  @lcs_dp["#{str1}-#{str2}"] = prob2
  prob2
end


puts lcs('aggtab', 'gxtxayb')