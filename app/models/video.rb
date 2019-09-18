class Video < ApplicationRecord
  mount_uploader :image, VideoUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  validates :name, :text, :image, {presence: true}
end
