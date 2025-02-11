require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    book = Book.new(title: "Test Book", author: "Author", isbn: "1234567890")
    assert book.valid?
  end

  test "should not be valid without title" do
    book = Book.new(author: "Author", isbn: "1234567890")
    assert_not book.valid?
  end

  test "should not be valid without author" do
    book = Book.new(title: "Test Book", isbn: "1234567890")
    assert_not book.valid?
  end

  test "should not be valid without ISBN" do
    book = Book.new(title: "Test Book", author: "Author")
    assert_not book.valid?
  end

  test "should not be valid with duplicate ISBN" do
    Book.create(title: "Test Book", author: "Author", isbn: "1234567890")
    book = Book.new(title: "Another Book", author: "Author", isbn: "1234567890")
    assert_not book.valid?
  end
end
