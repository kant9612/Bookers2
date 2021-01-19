class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

   def index
     @user = current_user
     @book = Book.new
     @users = User.all
     @books = Book.all
   end

   def show
     @user = User.find(params[:id])
     @books = @user.books.all
	   @book = Book.new
   end

   def edit
     @user = current_user
     if @user.id !=current_user.id
       redirect_to user_path(@current_user.id)
     end
   end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       flash[:success] = "Successfully updated."
       redirect_to user_path(@user.id)
     else
       render :action => "edit"
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end


end
