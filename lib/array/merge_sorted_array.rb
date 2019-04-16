# def merge(nums1, m, nums2, n)
#   i = m 
#   while(i < m + n)
#     nums1[i] = nums2[i - m]
#     i += 1
#   end
#   i = 0 
#   j = m
#   length = nums1.length
#   while(i < j && j < length)
#     k = i
#     while nums1[k] > nums1[j]
#       nums1[k], nums1[j] = nums1[j], nums1[k]
#       k += 1
#     end
#     unless nums1[i] > nums1[j]
#       i += 1 
#       j += 1 
#     end
#   end
#   nums1
# end

# puts merge([], 0, [], 0)

# puts merge([0,0,0], 0, [1,2,3], 3)
# puts merge([1,2,3], 0, [0,0,0], 0)

def merge(nums1, m, nums2, n)
  i = m 
  while(i < m + n)
    nums1[i] = nums2[i - m]
    i += 1
  end
  print nums1
  nums1.sort
end

puts merge([1,2,3,4,7,0,0,0], 5, [2,5,6], 3)

# puts merge([4,5,6,0,0,0], 3, [1,2,3], 3 )

# 123256
# 122356


