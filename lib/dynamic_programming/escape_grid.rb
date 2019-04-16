def solve(grid)
	rows = grid.length
	cols = grid[0].length
	# current_pos = [-1,-1]
	i = 0
	while(i < rows)
		j = 0
		while(j < cols)
			escape_grid(grid, [i,j]) if grid[i][j] == 2
			j+=1
		end
		i+=1
	end
end

def escape_grid(grid, current_pos)

end


grid = [[1,1,1,0,1],[1,0,2,0,1],[0,0,1,0,1],[1,0,1,1,0]]
solve(grid)


(2**(0.size * 8 -2) -1)

1 1 1 0 1
1 2 2 0 1
0 2 1 0 1
1 2 1 1 0