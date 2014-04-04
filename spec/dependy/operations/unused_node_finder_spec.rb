require 'dependy/operations/unused_nodes_finder'
require_relative '../../spec_helper'

describe Dependy::Operations::UnusedNodesFinder do
  context 'when node with no parents exist' do
    subject(:unused_node_finder) { described_class.new(GraphFactory.graph_without_cycles) }

    it 'returns unused nodes' do
      expect(subject.unused_nodes).to eql(['1'])
    end
  end

  context 'when all the nodes are used' do
    subject(:unused_node_finder) { described_class.new(GraphFactory.graph_with_cycles) }

    it 'returns empty array' do
      expect(subject.unused_nodes).to eql([])
    end
  end
end
