class UsersController < ApplicationController
  def login
    @user = User.find_by(:name => user_params['name'])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to sessions_path
    else
      redirect_to sessions_path, alert: 'Das Passwort oder der Benutzername sind falsch!'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
