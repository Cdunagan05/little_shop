FactoryGirl.define do
  factory :item do
    title 'Texas Jersey'
    description 'This is a cool Longhorn jersey'
    price 100.00
    image 'image_url'
  end

  factory :user do
    username 'User'
    password 'password'
  end
end
