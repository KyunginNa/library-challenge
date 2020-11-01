require './lib/person.rb'
require 'date'

describe Person do
    let(:library) {Library.new}
    subject { described_class.new(name: 'Thomas')}

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
        expect(subject.search('', library)).to eq expected_output
    end

    it 'can search book by its information' do
        expected_output = {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, 
        {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}
        expect(subject.search('Pippi', library)).to eq expected_output
    end

    it 'displays error message if the library does not have the book' do
        expected_output = {status: false, message: 'The book does not exist', date: Date.today}
        expect(subject.search('Harry', library)).to eq expected_output
    end

    describe 'person can borrow book if it is available' do
        before {subject.borrow_book('Alfons och soldatpappan', library)}
   
        it 'change book availability in the book list to false' do
            expect(subject.book_list[0][:available]).to be false
        end
        
        # it 'set return date in the book list' do
        #     expect(subject.book_list[0][:return_date]).to eq Date.today.next_month(1)
        # end
    end

    describe 'person can return borrowed book' do
        before {subject.borrow_book('Alfons och soldatpappan', library)}

        it 'can check if the person has the book in his/her book list' do
        expected_output = {status: false, message: 'You do not have this book in your possession!', date: Date.today}
        expect(subject.return_book('Harry Potter', library)).to eq expected_output
        end

        it 'return borrowed book to library' do
        
        end
    end
end