class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new #This is strange, an issue to do with routing when creating a
    # new object means @user, singular, needs to be instantiated in user#index
  end


  def new
    @user = User.new
  end


  def create
    @user = User.create(params[:user].permit(:name, :email))

    if @user.save
      redirect_to users_path, :notice => 'You have been registered'
    else
      render 'show'
    end
  end

end