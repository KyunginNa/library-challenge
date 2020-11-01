require 'yaml'
require 'date'
require './lib/library.rb'

class Person
    attr_accessor :book_list, :name

    def initialize(name)
        @name = name
        @book_list = []
    end

    def search(title, library)
        book_collection = library.book_collection
        if  book_collection.select { |obj| obj[:item][:title].include? title } != [] then
            books = book_collection.select { |obj| obj[:item][:title].include? title }
            return books
        else
            {status: false, message: 'The book does not exist', date: Date.today}
        end
    end

    def borrow_book(title, library)
        case
        when library.book_not_exist?(title) == true
            {status: false, message: 'The book does not exist', date: Date.today}
        when library.book_not_available?(title) == true
            {status: false, message: 'The book is not available now', date: Date.today}
        else 
            book_collection = library.book_collection
            books=search(title, library)
            books.each do |book|
                index = book_collection.index {|h| h[:item][:title] == book[:item][:title]}
                book_collection[index][:available] = false
                book_collection[index][:return_date] = Date.today.next_month(1)
                book = book_collection[index]
                @book_list << book
            end
            File.open('./lib/data.yml', 'w') { |f| f.write book_collection.to_yaml }
            {status: true, message: "You borrowed #{title}.", date: Date.today}
        end
    end

    def return_book(title, library)
        book_collection = library.book_collection
        case
        when @book_list.detect { |obj| obj[:item][:title] == title } == nil
            {status: false, message: 'You do not have this book in your possession!', date: Date.today}
        else
            book = @book_list.detect { |obj| obj[:item][:title] == title }
            index = book_collection.index {|h| h[:item][:title] == book[:item][:title]}
            book_collection[index][:available] = true
            book_collection[index][:return_date] = nil
            @book_list.delete_if { |obj| obj[:item][title] == title }
            File.open('./lib/data.yml', 'w') { |f| f.write book_collection.to_yaml }
            {status: true, message: "You have returned #{title}.", date: Date.today}
        end
    end
end