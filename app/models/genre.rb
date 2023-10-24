class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '医薬品' },
    { id: 3, name: '健康食品' },
    { id: 4, name: '介護・衛生' },
    { id: 5, name: '化粧品' },
    { id: 6, name: 'オーラル' },
    { id: 7, name: '雑貨' },
    { id: 8, name: '紙' },
    { id: 9, name: 'ベビー' },
    { id: 10, name: '食品' },
  ]

  include ActiveHash::Associations
  has_many :posts
end