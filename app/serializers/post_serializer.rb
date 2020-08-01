class PostSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :subtitle, :body, :keyworks, :category, :user
end
