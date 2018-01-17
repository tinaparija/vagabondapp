class Post < ApplicationRecord

  validates :title, length: {maximum: 200}, presence:true
  validates :content, presence:true

  belongs_to :user
  belongs_to :city
end
