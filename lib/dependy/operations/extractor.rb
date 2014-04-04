require 'dependy/graph/graph'

module Dependy
  module Operations
    class Extractor
      def initialize(graph = {})
        @graph = graph
      end

      def extract(nodes = [], ignore_nodes = [])
        nodes_to_extract(nodes) - ignore_nodes
      end

      private
      attr_reader :graph

      def nodes_to_extract(nodes)
        nodes.map do |node_name|
          extract_node(node_name)
        end.flatten.uniq
      end

      def extract_node(node_name, current_result = [])
        current_result << node_name
        graph.children_for(node_name).each do |child_name|
          extract_node(child_name, current_result) unless current_result.include?(child_name)
        end
        current_result
      end
    end
  end
end
