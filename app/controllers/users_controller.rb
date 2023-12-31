class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       cookies.signed[:user_id] = @user.id
      flash[:notice]="Signed up successfully"
      redirect_to root_path
    else
      flash.now[:alert]="Signed up failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
