class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memos
  has_many :comments

  validates :name, presence: true,
  format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true }
end
