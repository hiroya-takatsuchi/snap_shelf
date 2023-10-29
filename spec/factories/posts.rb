FactoryBot.define do
  factory :post do
    title { 'サンプル' }
    explanation { 'サンプルです' }
    genre_id { 2 }
    shelf_number_id { 2 }

    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/backg.jpg'), filename: 'backg.jpg')
    end
  end
end
