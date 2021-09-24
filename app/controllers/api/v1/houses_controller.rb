module Api::V1
  class HousesController < SecuredController
    def index
      @houses = House.all
  
      render json: @houses
    end
  
    def show
      @house = House.find(params[:id])
      return render json: @house, status: :ok if @house
    end
  
    def create
      @house = House.create!(house_params)
      render json: @house, status: :created
    end
  
    private
  
    def house_params
      params.permit(:house_name, :city, :address, :description_short, :price, :image)
    end
  end
end
