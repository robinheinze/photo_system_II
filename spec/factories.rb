FactoryGirl.define do
  factory :user, :class => User do
    email { Faker::Internet.email }
    name 'User'
    password 'password'
    password_confirmation {|u| u.password }
  end

  factory :post, :class => Post do
    title 'test-fox'
    content 'test-fox in a cup'
    photo_file_name 'fox-in-a-cup'
    photo_content_type 'image/jpg'
    photo_file_size '200'
  end
end
