class FriendshipsController < ApplicationController
  def index
    @users = User.order(:name).select do
      |u|u != current_user && !friend?(u.id)
    end
  end

  def friend?(user_id) 
    for f in current_user.friendships do      
      if user_id == f.friend_id 
        return true
      end
    end
    false
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to friendships_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to friendships_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to friendships_url
  end
end
