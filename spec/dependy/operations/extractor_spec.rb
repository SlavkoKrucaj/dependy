require 'dependy/operations/extractor'
require_relative '../../spec_helper'

describe Dependy::Operations::Extractor do
  subject(:extractor) { described_class.new(GraphFactory.graph_with_cycles) }

  it 'extracts node and all of its parents' do
    expect(subject.extract(['3'])).to eql(['3', '2'])
  end

  it 'should NOT extract ignored nodes' do
    expect(subject.extract(['3'], ['2'])).to eql(['3'])
  end
end
