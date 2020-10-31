require 'yaml'

class Library
    attr_accessor :book_collection

    def initialize
        @book_collection = YAML.load_file('./lib/data.yml')
    end
end
