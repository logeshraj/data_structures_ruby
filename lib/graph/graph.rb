class Graph
  attr_accessor :vertices, :edges
  def initialize
    super
    self.vertices = []
    self.edges = {}
  end

  def add_vertices(vertices)
    vertices.each do |vertex|
      self.vertices.push vertex
    end
    vertices
  end

  def add_edge(v1, v2, weight)
    if self.edges[v1]
      self.edges[v1].merge! Hash[v2, weight]
    else
      self.edges[v1] =  Hash[v2, weight]
    end
    if self.edges[v2]
      self.edges[v2].merge! Hash[v1, weight]
    else
      self.edges[v2] =  Hash[v1, weight]
    end
  end


end


gr = Graph.new
binding.irb
gr.add_vertices([1,2,3])
puts gr.inspect
gr.add_edge(1,2,1)
gr.add_edge(1,3,1)
gr.add_edge(2,1,2)
puts gr.inspect