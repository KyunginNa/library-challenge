# Library Challenge
​
## User Stories

>As a library operater  
>In order to keep track of the books we have  
>I want to have a list of the books with their title, author and availability

>As a library operator  
>In order to make visitors to return a book on time  
>I want to inform them due date when they check out books

>As a visitor  
>In order to borrow books  
>I want to search books by title and check their availability​


## The code
​
The application allows users to create a person and a library. A person can search a book by title to check if it is available, borrow a book and return it. As the person borrows/returns the book, its availability and return date in the yaml-file are updated. This is a back-end application running in IRB.
​

## Dependencies
​
RSpec 3.10.0 (https://rubygems.org/gems/rspec)  
YAML (https://yaml.org/)  
Pry 0.13.1 (https://rubygems.org/gems/pry)  
Pry-byebug 3.9.0 (https://rubygems.org/gems/pry-byebug)  
​Coveralls 0.8.23(https://rubygems.org/gems/coveralls)
​

## Setup
​
1. Clone the repo below to your local folder.
Repo: (https://github.com/Ehugo2000/library-challenge.git) or (https://github.com/KyunginNa/library-challenge.git)
​
2. Open the terminal and cd to the library-challenge folder.
​
3. Start IRB in your terminal and load Date class and the ruby files.
```ruby
require 'yaml'
require 'date'
load './lib/library.rb'
load './lib/person.rb'
```


## Instructions
​
1. Create a person and a library and make your first search for a book.
 ```ruby
person = Person.new(name: 'Tom')
library = Library.new
person.search('title', library)
# person.search('Pippi', library)
#  => [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
```
​
2. Borrow a book.
```ruby
person.borrow_book('title', library)
# person.borrow_book('Alfons och soldatpappan' , library)
#  => {:status=>true, :message=>"You borrowed Alfons och soldatpappan.", :date=>#<Date: 2020-11-01 ((2459155j,0s,0n),+0s,2299161j)>} 
# => #<Library:0x00007fc9baabf438 @book_collection=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>#<Date: 2020-12-01 ((2459185j,0s,0n),+0s,2299161j)>}, [...]> 
#  => #<Person:0x00007fc9bab2f440 @name={:name=>"Tom"}, @book_list=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>#<Date: 2020-12-01 ((2459185j,0s,0n),+0s,2299161j)>}]>
```
​
3. Return a borrowed book to library.
```ruby
person.return_book('title', library)
person.return_book('Alfons och soldatpappan' , library)
# => {:status=>true, :message=>"You have returned Alfons och soldatpappan.", :date=>#<Date: 2020-11-01 ((2459155j,0s,0n),+0s,2299161j)>} 
# => #<Library:0x00007fc9baabf438 @book_collection=[{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, [...]> 
# => #<Person:0x00007fc9bab2f440 @name={:name=>"Tom"}, @book_list=[]> 
```

​
## Acknowledgements
​
Project instructions from Craft Academy: (https://learn.craftacademy.co/courses/645199/lectures/11549663)  
Editor: VSC (https://code.visualstudio.com/)  
Programming language: (https://www.ruby-lang.org/en/documentation/installation/)  
Testing framework: Rspec and Pry (https://rspec.info/)
Gems: (https://rubygems.org)  
​

## Update and Improvements plans
​
- Add more books to library list.
- Add a method to send out reminders to borrowers that hold overdue books.
- Modify search method to conclude a wider search for literature.
- Create a copy of data.yml and set it as a data source(instead of setting data.yml) when a library instance is created.
​
## License
​
The MIT License (MIT).