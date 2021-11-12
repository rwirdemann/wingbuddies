class UsersController < ApplicationController
  def login
    session[:user] = params[:user][:name]
    redirect_to sessions_path
  end   

  def logout
    session[:user] = nil
    redirect_to sessions_path
  end    
end
