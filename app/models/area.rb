class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '都市型' },
    { id: 2, name: '郊外型' }
  ]

  include ActiveHash::Associations
  has_many :users
end
