require 'dependy/graph/graph'

module Dependy
  module Graph
    class GraphReader
      def initialize(root_folder, excluded_folders = [], pattern = '*')
        @root_folder = root_folder
        @excluded_folders = excluded_folders
        @pattern = pattern
      end

      def read
        Graph.new(objects_to_scan)
      end

      private
      attr_reader :root_folder, :excluded_folders, :pattern

      def objects_to_scan
        Dir.glob(lookup_pattern(root_folder)).inject([]) do |result, file|
          scan_file(file).map do |import|
            result.push([filename(file), import]) unless import.empty?
          end
          result
        end
      end

      def scan_file(file)
        all_imports_in_file(file) - [filename(file)] - objects_to_exclude
      end

      def filename(file)
        File.basename(file, '.*')
      end

      def objects_to_exclude
        @objects_to_exclude ||= excluded_folders.map do |excluded_folder|
          Dir.glob(lookup_pattern(excluded_folder)).map do |file|
            File.basename(file, '.*')
          end
        end.flatten.uniq
      end

      def lookup_pattern(folder)
        "#{folder}/**/*.#{pattern}"
      end

      def all_imports_in_file(file)
        File.read(file).scan(/^#import "(.*)\.h"$/).flatten
      end
    end
  end
end
