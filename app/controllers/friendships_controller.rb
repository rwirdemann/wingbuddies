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
    @friendship_current_user = current_user.friendships.build(:friend_id => params[:friend_id])

    friend = User.find(params[:friend_id])
    @friendship_new_friend = friend.friendships.build(:friend_id => current_user.id)

    if @friendship_current_user.save and @friendship_new_friend .save
      redirect_to friendships_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to friendships_url
    end
  end

  def destroy
    @friendship_current_user = current_user.friendships.find(params[:id])
    @friendship_friend = Friendship.find_by(friend_id: current_user.id)
    @friendship_current_user.destroy
    @friendship_friend.destroy

    redirect_to friendships_url
  end
end
