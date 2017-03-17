class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :user_id, type: Integer
  field :post_id, type: Integer

  belongs_to :user
  belongs_to :post
end
