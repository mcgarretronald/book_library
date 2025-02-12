# require "test_helper"

# class BorrowingTest < ActiveSupport::TestCase
#   def setup
#     @user = users(:test_user)  # Load the test user from fixtures
#     @book = books(:some_book)  # Load the test book from fixtures
#     @borrowing = Borrowing.new(user: @user, book: @book, due_date: Date.today + 7, returned: false)
#   end

#   test "should be valid" do
#     assert @borrowing.valid?
#   end

#   test "should require a user" do
#     @borrowing.user = nil
#     assert_not @borrowing.valid?
#   end

#   test "should require a book" do
#     @borrowing.book = nil
#     assert_not @borrowing.valid?
#   end

#   test "should have a due date" do
#     @borrowing.due_date = nil
#     assert_not @borrowing.valid?
#   end

#   test "default returned should be false" do
#     assert_not @borrowing.returned
#   end
# end
