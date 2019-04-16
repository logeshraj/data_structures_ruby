def path_sum(root, sum)
  @path_list = []
  path_sum_list(root, sum, 0, [])
  @path_list
end

def path_sum_list(node, sum, sum_so_far, arr)
  return if node.nil?
  new_arr = arr.dup
  new_arr << node.val
  @path_list << new_arr if sum == sum_so_far + node.val && node.left.nil? && node.right.nil?
  path_sum_list(node.left, sum, sum_so_far + node.val, new_arr)
  path_sum_list(node.right, sum, sum_so_far + node.val, new_arr)
  
end
