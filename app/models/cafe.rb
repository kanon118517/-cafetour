class Cafe < ApplicationRecord

  has_many :cafe_posts
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags

end
