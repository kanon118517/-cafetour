class CafePost < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  belongs_to :cafe
  has_many :likes, dependent: :destroy
  has_many :liked_cafe_posts, through: :likes, source: :cafe_post

end
