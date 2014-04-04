module Dependy
  module Operations
    class FolderExtractor

      def initialize(graph)
        @graph = graph
        @extractor = Extractor.new(graph)
      end

      def extract(folders = [], ignore_nodes = [])
        extractor.extract(all_nodes_in_folders(folders), ignore_nodes)
      end

      private
      attr_reader :graph, :extractor

      def all_nodes_in_folders(folders = [])
        folders.map { |folder| scan_folder(folder) }.flatten.uniq
      end

      def scan_folder(folder)
        Dir.glob(lookup_pattern(folder)).map { |file| File.basename(file, '.*') }
      end

      def lookup_pattern(folder)
        "#{folder}/**/*{h,m}"
      end
    end
  end
end
