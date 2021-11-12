class UsersController < ApplicationController
  def login    
    @user = User.find_by(:name => user_params['name'])  
    @user = User.create(user_params) unless @user
    session[:user_id] = @user.id
    redirect_to sessions_path
  end   

  def logout
    session[:user_id] = nil
    redirect_to sessions_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name)
    end

end
