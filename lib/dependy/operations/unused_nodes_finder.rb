require 'dependy/graph/graph'

module Dependy
  module Operations
    class UnusedNodesFinder
      def initialize(graph = {})
        @graph = graph
      end

      def unused_nodes
        graph.select { |node_name| graph.parents_for(node_name).count == 0 }.keys
      end

      private
      attr_reader :graph
    end
  end
end
