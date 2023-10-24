class Post < ApplicationRecord
  beklongs_to :user
  has_one_attached :image

end
