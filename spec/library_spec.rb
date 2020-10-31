require './lib/library.rb'

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

    it 'check if the library can access the hash of books and check its availability' do
        expect(subject.check_out_book('Pippi')).to eq true
    end

  
end