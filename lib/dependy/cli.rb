require 'thor'
require 'dependy'

module Dependy
  class Cli < Thor
    class_option :root_folder, type: :string, aliases: '-r', required: true, desc: 'Folder containing classes'
    class_option :ignore_folders, type: :string, aliases: '-i', required: true, desc: 'Ignored folders'
    class_option :pattern, type: :string, aliases: '-p', required: true, desc: 'Pattern you are looking for in the files, i.e. {h,m}'

    desc 'cycle', 'Scans the folder, and looks for cycles in dependencies'
    def cycle
      cycle_finder.cycles.each { |cycle| p cycle }
    end

    desc 'unused', 'Scans the folder, and looks for unused files'
    def unused
      unused_nodes_finder.unused_nodes.each { |unused_node| p unused_node }
    end

    desc 'extract', 'Example of what you get if you try to extract file "ApiCall"'
    method_option :file, type: :string, aliases: '-f', required: true, desc: 'File to extract'
    def extract
      puts extractor.extract([options[:file]])
    end

    desc 'folder', 'Example of what you get if you try to extract folder "ApiLayer"'
    method_option :folder, type: :string, aliases: '-f', required: true, desc: 'Folder to extract from'
    def folder
      puts folder_extractor.extract(options[:folder], ['Helpers', 'Translator'])
    end

    private
    def cycle_finder
      Operations::CycleFinder.new(graph)
    end

    def unused_nodes_finder
      Operations::UnusedNodesFinder.new(graph)
    end

    def extractor
      Operations::Extractor.new(graph)
    end

    def folder_extractor
      Operations::FolderExtractor.new(graph)
    end

    def graph
      graph_reader.read
    end

    def graph_reader
      Dependy::Graph::GraphReader.new(root_folder, [ignore_folder], '{h,m}')
    end

    def root_folder
      options[:root_folder]
    end

    def ignore_folder
      options[:ignore_folders].split(' ')
    end
  end
end
