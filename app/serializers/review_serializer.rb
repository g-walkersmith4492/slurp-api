class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :price, :rating, :location, :review
end
