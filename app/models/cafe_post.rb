class CafePost < ApplicationRecord

  has_one_attached :image
  
  belongs_to :user
  belongs_to :cafe
  has_many :likes, dependent: :destroy
  has_many :liked_cafe_posts, through: :likes, source: :cafe_post
  has_many :comments, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["cafe_comment", "cafe_id", "created_at", "id", "updated_at", "user_id"]
  end

end
