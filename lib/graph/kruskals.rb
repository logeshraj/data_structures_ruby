class Graph
  class Edge
    attr_accessor :src, :dest, :weight
    def initialize(src, dest, weight)
      self.src = src
      self.dest = dest
      self.weight = weight
    end

    def <=>(other)
      self.weight <=> other.weight
    end
  end

  class Node
    attr_accessor :value

    def initialize(value)
      self.value = value
    end
  end

  class Subset
    attr_accessor :parent, :rank

    def initialize(parent, rank)
      self.parent = parent
      self.rank = rank
    end
  end

	attr_accessor :nodes, :edges

  def initialize
    self.nodes = {}
    self.edges = []
  end

  def add_node(node)
    nodes[node.value] = node
  end

  def add_edge(src, dest, weight)
    edge = Edge.new(src, dest, weight)
    edges.push edge
  end

  def root(subsets, node)
    value = node.value
    subsets[value].parent = root(subsets, subsets[value].parent) if subsets[value].parent != node
    subsets[value].parent
  end

  def union(subsets, x, y)
    x_root = root(subsets, x)
    y_root = root(subsets, y)
    x_value = x_root.value
    y_value = y_root.value
    if subsets[x_value].rank < subsets[y_value].rank
      subsets[x_value].parent = y_root
    elsif subsets[x_value].rank > subsets[y_value].rank
      subsets[y_value].parent = x_root
    else
      subsets[y_value].parent = x_root
      subsets[x_value].rank += 1 
    end
  end

  def kruskal_mst
    subsets = {}
    sorted_edges = edges.sort
    v = nodes.length
    nodes.each do |value, node|
      subsets.merge! Hash[value, Subset.new(node, 0)]
    end
    result = []    
    e = 0
    i = 0
    while (e < v-1)
      next_edge = sorted_edges[i]
      i+=1
      x = root(subsets, next_edge.src)
      y = root(subsets, next_edge.dest)
      if (x!=y)
        result[e] = next_edge
        e+=1
        union(subsets, x, y)
      end 
    end
    result
  end

  def self.kruskal_test
    node0 = Node.new(11)
    node1 = Node.new(4)
    node2 = Node.new(7)
    node3 = Node.new(10)
    node4 = Node.new(14)
    node5 = Node.new(15)
    node6 = Node.new(13)

    graph = self.new
    graph.add_node node0
    graph.add_node node1
    graph.add_node node2
    graph.add_node node3
    graph.add_node node4
    graph.add_node node5
    graph.add_node node6

    graph.add_edge(node0, node1, 10)
    graph.add_edge(node0, node2, 6)
    graph.add_edge(node0, node3, 5)
    graph.add_edge(node2, node3, 4)
    graph.add_edge(node3, node1, 15)
    graph.add_edge(node3, node4, 3)
    graph.add_edge(node3, node5, 4)
    graph.add_edge(node4, node5, 5)
    graph.add_edge(node1, node6, 10)
    graph.add_edge(node4, node6, 2)

    print_kruskal(graph.kruskal_mst)
  end

  def self.print_kruskal(edges)
    edges.each do |edge|
      puts "#{edge.src.value} -- #{edge.weight} -- #{edge.dest.value} "
    end
  end
end

Graph.kruskal_test