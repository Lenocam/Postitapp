class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Nice Save, New User"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])    
  end

private
def user_params
  params.require(:user).permit(:username, :password, :time_zone)  
end

end