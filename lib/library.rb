require 'yaml'
require 'pry'

class Library
    attr_accessor :book_collection

    def initialize
        @book_collection = YAML.load_file('./lib/data.yml')
    end

    def check_out_book(title) 
        books = @book_collection.select { |obj| obj[:item][:title].include? title }    
        books != nil ? true : false

    end

end
