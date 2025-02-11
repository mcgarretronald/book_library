class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def borrow
    @book = Book.find(params[:id])
    if @book.available?
      @borrowing = current_user.borrowings.create(book: @book, due_date: 2.weeks.from_now, returned: false)
      redirect_to user_profile_path, notice: "Book borrowed successfully."
    else
      redirect_to books_path, alert: "This book is already borrowed."
    end
  end

  def return_book
    @borrowing = current_user.borrowings.find_by(book_id: params[:id], returned: false)
    if @borrowing
      # Update the borrowing record to mark the book as returned
      @borrowing.update!(returned: true)
      redirect_to user_profile_path, notice: "Book returned successfully."
    else
      redirect_to books_path, alert: "You have not borrowed this book or it is already returned."
    end
  end
end
