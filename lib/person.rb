require 'yaml'
require 'date'

class Person
    attr_accessor :book_list

    def initialize
        @book_list = []
    end

    def search(title)
        book_collection = YAML.load_file('./lib/data.yml')
        if  book_collection.select { |obj| obj[:item][:title].include? title } != [] then
            books = book_collection.select { |obj| obj[:item][:title].include? title }
            return books
        else 
            {status: false, message: 'The book does not exist', date: Date.today}
        end
    end


    def borrow_book(title)
        book_collection = YAML.load_file('./lib/data.yml')
        books=search(title)
        books.each do |book|
            index = book_collection.index {|h| h[:item][:title] == book[:item][:title]}
            book_collection[index][:available] = false
            
            book_collection[index][:return_date] = Date.today.next_month(1)
            
            book = book_collection[index]
            @book_list << book
        end
        File.open('./lib/data.yml', 'w') { |f| f.write book_collection.to_yaml }
    end
end