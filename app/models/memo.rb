class Memo < ApplicationRecord
  mount_uploader :image, VideoUploader
  belongs_to :user
end