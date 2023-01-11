class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #image_tag @user.photos.last.image(:small).url #=> in user show page
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to the TwitterClone #{@user.username}, you have successfully signed up!"
        redirect_to tweets_path
    else
        render 'new', status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Account was deleted successfully.'
  end
end
