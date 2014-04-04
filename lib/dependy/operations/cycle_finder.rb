require 'tsort'

module Dependy
  module Operations
    class CycleFinder
      def initialize(graph = {})
        @graph = graph
      end

      def cycles
        strongly_connected_components.select { |scc| scc.count > 1 }
      end

      private
      include TSort
      attr_reader :graph

      def tsort_each_node(&block)
        graph.each_key(&block)
      end

      def tsort_each_child(node_name, &block)
        graph.children_for(node_name).each(&block)
      end
    end
  end
end
