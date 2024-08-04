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
  
  
  
  
  
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
end
