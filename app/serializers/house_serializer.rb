class HouseSerializer < ActiveModel::Serializer
  attributes :id, :house_name, :city, :address, :description_short, :price
end