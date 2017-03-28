class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the Sample App!"
      redirect_to @user
    else
    render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followed_users
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_microposts
  end
  
  private
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if @user != current_user
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location)
  end
end