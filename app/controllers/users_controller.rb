class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  def user
        params.require(:user).permit(:title, :body, :image)
  end 
end
