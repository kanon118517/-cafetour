class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cafe_post
end
