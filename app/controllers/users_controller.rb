class UsersController < ApplicationController
    
  before_action :find_user, only: [:show, :edit, :update, :destroy]
    
  def new
    @user = User.new  
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the blog"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render :edit
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    
    def find_user
      @user = User.find(params[:id])
    end
end