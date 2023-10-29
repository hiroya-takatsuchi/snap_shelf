FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.email}
    password { Faker::Internet.password(min_length: 4) + 'y1' }
    password_confirmation {password}
    area_id { 2 }
    prefectures_id { 2 }

  end
end