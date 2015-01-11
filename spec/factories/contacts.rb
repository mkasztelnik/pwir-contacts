FactoryGirl.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    telephone { Faker::PhoneNumber.cell_phone }
    address { Faker::Lorem.paragraph }
  end
end
