class FriendshipsController < ApplicationController
    def submit
        @user = User.find(params[:user_id])
        friendship = Friendship.new()
        friendship.from_user_id = current_user.id
        friendship.to_user_id = @user.id
        friendship.save
        redirect_to user_path(@user.id)
    end
end
