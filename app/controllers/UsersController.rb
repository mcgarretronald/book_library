class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @borrowings = current_user.borrowings.includes(:book).where(returned: false)
  end
end
