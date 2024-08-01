class BooksController < ApplicationController
  
  
  
  
  
  def create
    @books = Books.new(books_params)
    @Books.user_id = current_user.id
    @Books.save
    redirect_to books_path
  end
  
  
  
  
  
  
  
  
  
  def books_params
    params.require(:books).permit(:title, :body)
  end
end
