class Api::V1::HousesController < Api::V1::ApiController
  before_action :set_house, only: %i[show update destroy]

  def index
    @houses = House.all

    render json: @houses
  end

  def show
    render json: @house
  end

  def create
    @house = House.new(house_params)

    if @house.save
      render json: @house, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def update
    if @house.update(house_params)
      render json: @house
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @house.destroy
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:house_name, :city, :address, :description_short, :price)
  end
end
