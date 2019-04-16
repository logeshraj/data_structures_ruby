class Graph
  class Node
    attr_accessor :value, :key, :adjacents

    def initialize(value)
      self.value = value
      self.adjacents = []
      self.key = 99999999999999999
    end

    def <=>(other)
      self.key <=> other.key
    end
  end

  class Adjacent
    attr_accessor :node, :weight

    def initialize(node, weight)
      self.node = node
      self.weight = weight
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
    src.adjacents.push Adjacent.new(dest, weight)
    dest.adjacents.push Adjacent.new(src, weight)
  end

  def prims(node)
    binding.irb
    return if @not_set.empty? || @mst_set[node.value]
    @mst_set.merge! Hash[node.value, node] 
    @not_set.delete node
    node.adjacents.each do |adj|
      adj.node.key = adj.weight if adj.weight < adj.node.key
      @not_set.push adj.node unless @not_set.index adj.node
    end
    @not_set.sort.each do |not_set_node|
      prims not_set_node unless @mst_set[not_set_node.value]
    end
    @mst_set
  end

  def prims_mst
    @mst_set = {}
    @not_set = []
    first_node = nodes.first[1]
    first_node.key = 0
    @not_set.push first_node
    prims(first_node)
  end

 
  def self.prims_test
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

    graph.prims_mst
  end

  def self.print_prims(nodes)
    edges.each do |edge|
      puts "#{edge.src.value} -- #{edge.weight} -- #{edge.dest.value} "
    end
  end
end

Graph.prims_test