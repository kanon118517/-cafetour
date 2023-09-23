class Cafe < ApplicationRecord

  has_many :cafe_posts
  has_many :cafe_tags, dependent: :destroy
  has_many :tags, through: :cafe_tags

  def self.ransackable_attributes(auth_object = nil)
    ["cafe_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cafe_posts", "cafe_tags", "tags"]
  end
end
