class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = Picture.new
    @user.email = params[:user][:email]
    @user.password_digest = params[:user][:password_digest]

    if @user.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end


end
