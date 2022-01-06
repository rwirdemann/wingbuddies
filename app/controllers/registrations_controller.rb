class RegistrationsController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to sessions_path, notice: "Willkommen #{@user.name}. Dein Konto wurde erfolgreich erstellt. Du kannst jetzt Deine erste Session einstellen!"
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
