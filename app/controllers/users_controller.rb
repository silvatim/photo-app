class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :show]
  before_action :authorise, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def following
   @user = User.find(params[:id])
   @following = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :image, :password,
                                 :password_confirmation, :country, :city, :about)
  end

  def set_user
    @user = @current_user
  end

  def authorise
    unless @current_user.present?
    flash[:error] = "You need to be logged in to do that"
    redirect_to login_path
    end
  end

end
