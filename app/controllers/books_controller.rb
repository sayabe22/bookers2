class BooksController < ApplicationController
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
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
