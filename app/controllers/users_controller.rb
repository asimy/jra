class UsersController < ApplicationController
  
  def new
    @user = User.new
    @title = "Register"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Juvenile Risk Assessment!"
      redirect_to @user
    else
      @title = 'Register'
      @user.password = ''
      render 'new'
    end
  end
end
