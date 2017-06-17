class FavoritesController < ApplicationController
    def favorite
        @chatroom = Chatroom.find(params[:chatroom_id])
        favorite = current_user.favorites.build(chatroom_id: @chatroom.id)
        favorite.save
    end
    
    def unfavorite
        @chatroom = Chatroom.find(params[:chatroom_id])
        favorite = current_user.favorites.find_by(chatroom_id: @chatroom.id)
        favorite.destroy
    end
end
