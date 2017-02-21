class FoodSerializer < ActiveModel::Serializer
  attributes :name, :category
  belongs_to :category
end
