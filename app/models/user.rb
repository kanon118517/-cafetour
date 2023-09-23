class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
     find_or_create_by!(email: 'guest@example.com') do |user|
       user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
       user.name = "ゲスト"
      end
  end

    has_many :cafe_posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments

    has_one_attached :profile_image

   def active_for_authentication?
       super && (is_deleted == false)
   end

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

    def liked_by?(cafe_post_id)
     likes.where(cafe_post_id: cafe_post_id).exists?
    end

end
