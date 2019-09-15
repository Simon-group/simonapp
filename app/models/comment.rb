class Comment < ApplicationRecord
  belongs_to :video
  belongs_to :user

  validates :text, presence: true, length: { minimun: 5,maximum: 30}
end