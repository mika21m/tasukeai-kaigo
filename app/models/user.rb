class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :goods, dependent: :destroy

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  def gooded_by?(post_id)
    goods.where(post_id: post_id).exists?
  end

end
