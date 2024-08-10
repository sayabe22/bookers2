class BooksController < ApplicationController
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    end
      render :index
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end 
  
  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "You have uppdated book successfully."
     redirect_to books_path
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
