class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def borrow
    @book = Book.find(params[:id])
    if @book.borrowings.empty?
      Borrowing.create(user: current_user, book: @book)
      redirect_to books_path, notice: "You have borrowed the book!"
    else
      redirect_to books_path, alert: "Book already borrowed."
    end
  end
end
