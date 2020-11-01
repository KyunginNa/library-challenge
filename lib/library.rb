require 'yaml'
require 'pry'
require 'date'

class Library
    attr_accessor :book_collection

    def initialize
        @book_collection = YAML.load_file('./lib/data.yml')
    end

    def check_availability(title)
        case
        when book_not_exist?(title)
            {status: false, message: 'The book does not exist', date: Date.today}
        when book_not_available?(title)
            {status: false, message: 'The book is not available now', date: Date.today}
        else
            return true 
        end
    end
    
    def book_not_exist?(title)
        books = @book_collection.select { |obj| obj[:item][:title].include? title }
        books == []
    end

    def book_not_available?(title)
        books = @book_collection.select { |obj| obj[:item][:title].include? title }
        books[0][:available] == false
    end

end