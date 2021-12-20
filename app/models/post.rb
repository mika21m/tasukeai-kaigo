class Post < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes
  has_many :goods
end

