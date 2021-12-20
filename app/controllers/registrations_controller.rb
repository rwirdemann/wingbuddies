class RegistrationsController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to sessions_path, notice: 'Dein Account wurde erfolgreich erstellt!'
    else
      redirect_to sessions_path, notice: @user.errors.full_messages[0]
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
