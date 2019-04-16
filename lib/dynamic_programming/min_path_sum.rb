def unique_paths_with_obstacles(grid)
  return 0 if grid.nil? || grid.empty?
    
  rows = grid.length
  cols = grid[0].length
  
  i = 0
  j = 1
  while(j < cols)
    grid[i][j] = grid[i][j] + grid[0][j-1]
    j+=1 
  end
  i = 1
  j = 0
  while(i < rows)
    grid[i][j] = grid[i][j] + grid[i-1][j]
    i += 1
  end
  i = 1
  while(i < rows)
    j = 1
    while(j < cols)
      grid[i][j] = grid[i][j] + [grid[i-1][j], grid[i][j-1]].min
      j += 1
    end
    i += 1
  end
  grid[rows-1][cols-1]  
end

# unique_paths_with_obstacles([[1,0]]) 