class Graph
  class Node
    attr_accessor :value, :key, :adjacents

    def initialize(value)
      self.value = value
      self.edges = []
      self.key = 99999999999999999
    end

    def <=>(other)
      self.key <=> other.key
    end
  end

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

    def <(other)
      self.weight < other.weight
    end

    def >(other)
      self.weight > other.weight
    end

    def <=(other)
      self.weight <= other.weight
    end
    def >=(other)
      self.weight >= other.weight
    end

    def !=(other)
      self.weight != other.weight
    end
  end


  class EdgeHeap
    attr_accessor :array, :size 

    def initialize
      @array = []
      @size = 0
    end

    def insert(edge)
      @array.push edge
      bubble_up
      @size+=1
      @array
    end

    def pop
      return nil if @array.nil? || @array.empty?
      min = @array[0]
      @array[0] = @array[@array.length-1]
      @array.delete_at @array.length-1
      bubble_down
      @size-=1
      min
    end

    def peek
      @array[0]
    end

    def left_child(index)
      @array[left_child_index(index)]
    end

    def right_child(index)
      @array[right_child_index(index)]
    end

    def left_child_index(index)
      index*2+1
    end

    def right_child_index(index)
      index*2+2
    end

    def parent_index_of(index)
      return index-1/2 if index%2 ==0
      index-2/2
    end

    def bubble_up
      index = @array.length-1
      parent_index = parent_index_of(index)
      parent = @array[parent_index]
      while index > 0 && parent > @array[index]
        swap(parent_index, index)
        index = parent_index
        parent_index = parent_index_of(index)
        parent = @array[parent_index]
      end
    end

    def swap(index_a, index_b)
      temp = @array[index_a]
      @array[index_a] = @array[index_b]
      @array[index_b] = temp
    end

    def bubble_down
      index = 0
      while(!left_child(index).nil?)
        smaller_child_index = left_child_index(index)
        smaller_child_index = right_child_index(index) unless right_child(index).nil? && right_child(index) < left_child(index)
        if @array[smaller_child_index] < @array[index]
          swap(smaller_child_index, index)
        else
          break
        end
        index = smaller_child_index
      end
    end
  end

	attr_accessor :nodes, :edges

  def initialize
    self.nodes = []
    self.edges = []
  end

  def add_node(node)
    nodes[node.value] = node
  end

  def add_edge(src, dest, weight)
    edge = Edge.new(src, dest, weight)
    rev_edge = Edge.new(dest, src, weight)
    src.edges.push edge
    dest.edges.push rev_edge
    self.edges.push edge
  end


  def dijkstra(node)
  end

  def dijkstra_spt
    @spt_set = {}
    @not_added_set = nodes
    @nodes.each 

    first_node = @nodes[0] 
    first_node.key = 0
    @spt_set.push first_node
    dijkstra(first_node)
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