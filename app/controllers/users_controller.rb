class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to root_url
    else
      # otherwise render new.html.erb
      render :new
    end
  end


end
