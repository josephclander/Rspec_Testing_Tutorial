# frozen_string_literal: false

require 'yaml'
# library class
class Library
  attr_accessor :books

  def initialize(lib_file = false)
    @lib_file = lib_file
    @books = @lib_file ? YAML.load(File.read(@lib_file)) : []
  end

  def books_in_category(category)
    @books.select do |book|
      book.category == category
    end
  end

  def add_book(book)
    @books.push(book)
  end

  def get_book(title)
    @books.select { |book| book.title == title }.first
  end

  def saves(lib_file = false)
    # will get = what they input || what already have || new name
    @lib_file = lib_file || @lib_file || 'library.yml'
    File.open @lib_file, 'w' do |f|
      f.write YAML.dump @books
    end
  end
end
