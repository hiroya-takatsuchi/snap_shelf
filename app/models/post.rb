class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shelf_number_id, numericality: { other_than: 1, message: "can't be blank" }

end
