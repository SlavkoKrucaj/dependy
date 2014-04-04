module Dependy
  module Graph
    class Graph < Hash
      def initialize(parent_child_list = [])
        parent_child_list.each do |parent, child|
          add_node_to_graph(parent)
          add_node_to_graph(child)
          add_relationship_between(parent, child)
        end
      end

      def parents_for(node_name)
        self[node_name][:parents]
      end

      def children_for(node_name)
        self[node_name][:children]
      end

      private
      def add_node_to_graph(node_name)
        self[node_name] = {parents: [], children: []} unless has_key?(node_name)
      end

      def add_relationship_between(parent, child)
        self[parent][:children] << child
        self[child][:parents] << parent
      end
    end
  end
end
