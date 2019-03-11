class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :name, :ramen_type, :price, :rating, :location, :comments
end
