require './lib/library.rb'
require 'date'

describe Library do
    it 'has 5 books on initialize' do
        expected_output = [
            {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Skartta lagon! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"2020-11-07"}, 
            {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
            {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}] 
        expect(subject.book_collection).to eq expected_output
    end

    it 'check if the book passed in is available' do
        expect(subject.check_out_book('Osynligt')).to eq true
    end

    it 'check if the library has the book that is passed in' do
        expect(subject.check_out_book('Osynligt')).to eq true
    end

    # it 'rejects if the book does not exist' do
    #     expected_output = {status: false, message: 'The book does not exist', date: Date.today}
    #     expect(subject.check_out_book('Harry Potter')).to eq expected_output
    # end

end