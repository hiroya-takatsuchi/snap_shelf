class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one_attached :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search, prefectures_id, area_id)
    posts = Post.joins(:user)
    posts = posts.where('posts.explanation LIKE(?) OR posts.title LIKE(?)', "%#{search}%", "%#{search}%") if search.present?
    posts = posts.where('users.prefectures_id = ?', prefectures_id) if prefectures_id.present?
    posts = posts.where('users.area_id = ?', area_id) if area_id.present?
    posts
  end

  # def self.search(search)
  #   if search 
  #     Post.where('explanation LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%")
  #   else
  #     Post.all
  #   end
  # end

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shelf_number_id, numericality: { other_than: 1, message: "can't be blank" }
end
