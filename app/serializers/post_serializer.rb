class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :date, :title, :content
end
