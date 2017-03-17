class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic


  field :title, type: String
  field :body, type: String
  field :user_id, type: Integer

  belongs_to :user

  has_many :comments
  validates :title, presence: true
end
