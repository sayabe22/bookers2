class BooksController < ApplicationController
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end 
  
  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to books_path
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
