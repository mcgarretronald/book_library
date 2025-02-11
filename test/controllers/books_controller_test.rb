require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @book = books(:one)
  end

  test "should borrow book" do
    assert_difference("Borrowing.count", 1) do
      post borrow_book_path(@book)
    end
    assert_redirected_to books_path
    follow_redirect!
    assert_match "You have successfully borrowed the book", response.body
  end
end
