require 'dependy/graph/graph_reader'

describe Dependy::Graph::GraphReader do
  context 'when given all the info' do
    subject(:graph) {
      root_folder = 'spec/fixtures/root_folder'
      ignore_folder = 'spec/fixtures/ignore_folder'
      pattern = '{h,m}'
      described_class.new(root_folder, [ignore_folder], pattern)
    }

    it 'reads the graph' do
      expected = {
        'File1' => {parents: [], children: ['File2', 'File4', 'File3']},
        'File2' => {parents: ['File1'], children: ['File3']},
        'File4' => {parents: ['File1'], children: []},
        'File3' => {parents: ['File2', 'File1'], :children => []}
      }
      expect(subject.read).to eql(expected)
    end
  end

  context 'when given only root folder' do
    subject(:graph) {
      root_folder = 'spec/fixtures/root_folder'
      pattern = '{h,m}'
      described_class.new(root_folder, [], pattern)
    }

    it 'reads the graph' do
      expected = {
        'File1' => {parents: [], children: ['File2', 'File4', 'File5', 'File3']},
        'File2' => {parents: ['File1'], children: ['File3']},
        'File4' => {parents: ['File1'], children: []},
        'File5' => {parents: ['File1'], children: []},
        'File3' => {parents: ['File2', 'File1'], :children => []}
      }
      expect(subject.read).to eql(expected)
    end
  end
end
