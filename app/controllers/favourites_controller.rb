class FavouritesController < ApplicationController
  def create
    @favourite = current_user.favourites.new(house_id: params[:house_id])

    if @favourite.save
      render json: { notice: "You add favourite to this house" }
    else
      render json: { alert: "You already add to you favourite list."}
  end

  def destroy
    favourite = Favourite.find_by(id: params[:id], user: current_user, house_id: params[:housy_id])
    if favourite
      favourite.destroy
      render json: { notice: "You deleted house from your favourite list." }
    else
      render json: { alert: "You cannot unfavourite a house that you did not make you favourite before." }
    end
  end
end
