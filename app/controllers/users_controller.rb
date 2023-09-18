class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      redirect_to books_path(@books)
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if
      @user.update(user_params)
      flash[:update] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end 
