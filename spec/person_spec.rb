require './lib/person.rb'
require 'date'

describe Person do
    it 'has an empty book list on initialize' do
        expect(subject.book_list).to match_array([])
    end

    it 'can access the book list' do
        expected_output = [
            {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Skartta lagon! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2020-11-07"}, 
            {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}] 
        expect(subject.search('')).to eq expected_output
    end

    it 'can search book by its information' do
        expected_output = {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}
        expect(subject.search('Pippi')).to eq expected_output
    end

    it 'displays error message if the library does not have the book' do
        expected_output = {status: false, message: 'The book does not exist', date: Date.today}
        expect(subject.search('Harry')).to eq expected_output
    end

    it 'person can pick available books and add to his/her book_list' do
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>nil}]
        subject.borrow_book('Alfons och soldatpappan')
        expect(subject.book_list).to eq expected_output
    end

    # it 'can change availability of the book to false when person borrows the book' do

    # end
end