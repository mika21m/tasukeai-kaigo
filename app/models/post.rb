class Post < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :goods, dependent: :destroy
end

