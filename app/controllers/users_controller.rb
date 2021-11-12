class UsersController < ApplicationController
  def login
    session[:user] = User.new(:name => params[:user][:name])
    redirect_to sessions_path
  end   

  def logout
    session[:user] = nil
    redirect_to sessions_path
  end    
end
