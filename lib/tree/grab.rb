def solution(t)
  perfect_tree_nodes(t)
end

def perfect_tree_nodes(t)
  @head = t
  @overall_max = 0
  max_levels = max_perfect_subtree_levels(t)
  return (2 ** max_levels) - 1 if max_levels
end

def max_perfect_subtree_levels(t)
  return 0 if t.nil?
  local_max = 1
  if t.l || t.r
    left_levels = max_perfect_subtree_levels(t.l)
    right_levels = max_perfect_subtree_levels(t.r)
    if left_levels == right_levels
      local_max =  1 + left_levels
    else
      local_max = 1
      local_max = 2 if t.l && t.r
    end
  else
    local_max = 1
  end
  @overall_max = local_max if local_max > @overall_max
  return @overall_max if t == @head
  local_max
end