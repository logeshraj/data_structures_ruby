def unique_paths_with_obstacles(obstacle_grid)
  return 0 if obstacle_grid.nil? || obstacle_grid.empty?
    
  rows = obstacle_grid.length
  cols = obstacle_grid[0].length
  return if grid[0][0] == 1
  obstacle_grid[0][0] = 1
  
  i = 0
  j = 1
  while(j < cols)
    obstacle_grid[i][j] = obstacle_grid[i][j] == 1 ? 0 : obstacle_grid[0][j-1]
    j+=1 
  end
  i = 1
  j = 0
  while(i < rows)
    obstacle_grid[i][j] = obstacle_grid[i][j] == 1 ? 0 : obstacle_grid[i-1][j]
    i += 1
  end
  i = 1
  while(i < rows)
    j = 1
    while(j < cols)
      obstacle_grid[i][j] = obstacle_grid[i][j] == 1 ? 0 : (obstacle_grid[i-1][j] + obstacle_grid[i][j-1])
      j += 1
    end
    i += 1
  end
  obstacle_grid[rows-1][cols-1]  
end

unique_paths_with_obstacles([[1,0]])