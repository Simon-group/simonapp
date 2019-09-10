class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_videos, through: :likes, source: :video
  has_many :comments

  def already_liked?(video)
    self.likes.exists?(video_id: video.id)
  end

  validates :name, presence: true,
  format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true }
end
