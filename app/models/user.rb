class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :nickname, presence: true
  validates :prefectures_id, presence: true
  validates :area_id, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  def total_likes
    likes.count
  end

  
end
