class FavoritesController < ApplicationController

    def update
        @element = element_class.find(favorite_params[:favoritable_id])
        current_user.favorited?(@element) ? current_user.unfavorite(@element) : current_user.favorite(@element)
        @favorite = Favorite.last

        if @favorite
            authorize @favorite
        else
            skip_authorization
        end
    end

    private

    def element_class
        favorite_params[:favoritable_type].classify.constantize
    end

    def favorite_params
        params.require(:favorite).permit(:favoritable_id, :favoritable_type)
    end
end