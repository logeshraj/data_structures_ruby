def all_paths_source_target(graph)
	@n = graph.length - 1
	@graph = graph
    solve(0)
end

def solve(node)
	return [[@n]] if node == @n
	ans = []
	@graph[node].each do |neighbour|
		solve(neighbour).each do |path|
			ans << [node] + path
		end
	end
	ans
end


all_paths_source_target([[1,2], [3], [3], []])