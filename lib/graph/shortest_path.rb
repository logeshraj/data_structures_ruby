def shortest_path_length(graph)
    n = graph.length
    queue = []
    for i in 0..n-1
        queue << [1 << i, i]
    end
    dist = {}
    for i in 0..n-1
        dist[[1<<i, i]] = 0
    end
    while(!queue.empty?)
        cover, head = queue.shift
        d = dist[[cover, head]]
        return d if cover == (1 << n) - 1
        
        graph[head].each do |child|
            cover2 = cover | (1 << child)
            if d + 1 < (dist[[cover2, child]] || 999999999999999999)
                dist[[cover2, child]] = d + 1
                queue << [cover2, child]
            end
        end
    end
end



shortest_path_length([[1,2,3],[0],[0],[0]])