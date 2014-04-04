require 'dependy/operations/cycle_finder'
require_relative '../../spec_helper'

describe Dependy::Operations::CycleFinder do
  context 'when graph contains cycles' do
    subject(:cycle_finder) { described_class.new(GraphFactory.graph_with_cycles) }

    it 'returns an array of found cycles' do
      expect(subject.cycles).to eql([['2', '3'], ['1', '4']])
    end
  end

  context 'when graph does NOT contain cycles' do
    subject(:cycle_finder) { described_class.new(GraphFactory.graph_without_cycles) }

    it 'returns an empty array' do
      expect(subject.cycles).to eql([])
    end
  end
end
