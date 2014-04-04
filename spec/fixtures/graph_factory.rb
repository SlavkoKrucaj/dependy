require 'dependy/graph/graph'

class GraphFactory
  def self.graph_with_cycles
    Dependy::Graph::Graph.new([['1', '2'], ['1', '4'], ['2', '3'], ['3', '2'], ['4', '1']])
  end

  def self.graph_without_cycles
    Dependy::Graph::Graph.new([['1', '2'], ['2', '3'], ['2', '4']])
  end
end
