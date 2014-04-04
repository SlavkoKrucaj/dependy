require 'dependy/graph/graph'

describe Dependy::Graph::Graph do
  subject(:graph) { described_class.new([%w(parent child)]) }

  context 'when creating graph' do
    before do
      @expected_graph = {
        'parent' => {parents: [], children: ['child']},
        'child' => {parents: ['parent'], children: []}
      }
    end

    it 'should properly setup relationships' do
      expect(graph).to eql(@expected_graph)
    end
  end

  describe '#parents_for' do
    context 'when node contains parents' do
      it 'returns an array of parents' do
        expect(graph.parents_for('parent')).to eql([])
      end
    end

    context 'when node does NOT contain parents' do
      it 'returns an empty array' do
        expect(graph.parents_for('child')).to eql(['parent'])
      end
    end
  end

  describe '#children_for' do
    context 'when node contains children' do
      it 'returns an array of children' do
        expect(graph.children_for('parent')).to eql(['child'])
      end
    end

    context 'when node does NOT contain children' do
      it 'returns an empty array' do
        expect(graph.children_for('child')).to eql([])
      end
    end
  end
end
