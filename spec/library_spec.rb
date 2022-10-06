# frozen_string_literal: false

# video tutorial from 2011 (11 years out of date at this point)
# https://www.youtube.com/watch?v=JhR9Ib1Ylb8

# use expect() and NOT .should

require 'library'
# author didn't require book but tests didn't fail?!
require 'book'

describe 'Library Object' do
  # this writes an array of books and creates a 'books.yml' file with them
  before :all do
    lib_arr = [
      Book.new('Book One', 'Author 1', :development),
      Book.new('Book Two', 'Author 2', :design),
      Book.new('Book Three', 'Author 3', :usability),
      Book.new('Book Four', 'Author 4', :development),
      Book.new('Book Five', 'Author 5', :design)
    ]

    File.open 'books.yml', 'w' do |f|
      f.write YAML.dump lib_arr
    end
  end

  # by using each we reset our test env after every test
  before :each do
    @lib = Library.new 'books.yml'
  end

  describe '#new' do
    context 'with no parameters' do
      it 'has no books' do
        lib = Library.new
        # there may be a better way of doing this
        # but was using should and have methods which are deprecated
        expect(lib.books.length).to eql 0
      end
    end

    context 'with a yaml file name parameter' do
      it 'has 5 books' do
        expect(@lib.books.length).to eql 5
      end
    end
  end

  it 'returns all the books in a given category' do
    expect(@lib.books_in_category(:development).length).to eql 2
  end

  it 'accepts new books' do
    @lib.add_book(Book.new('Book Six', 'Author 6', :design))
    # NOTE: checking its an instance not just has text 'Book Six'
    expect(@lib.get_book('Book Six')).to be_an_instance_of Book
  end

  it 'saves the library' do
    # changed from map { |book| book.title }
    # object passed in, extract the title method
    # can use this as no calculations are required
    books = @lib.books.map(&:title)
    @lib.saves 'our_new_library.yml'
    lib2 = Library.new 'our_new_library.yml'
    books2 = lib2.books.map(&:title)
    expect(books).to eql books2
  end
end
