class PostSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :subtitle, :body, :keyworks, :created_at, :category, :user
end
