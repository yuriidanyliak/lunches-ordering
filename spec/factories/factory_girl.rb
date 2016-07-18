FactoryGirl.define do
  factory :daily_menu do
  end

  factory :user do
    email 'test@example.com'
    password 'password'
    access_token 'fd666b66a90fc6b657df'
  end

  factory :first_course do
    name 'soup'
    price 50.0
  end

  factory :main_course do
    name 'steak'
    price 100.0
  end

  factory :drink_course do
    name 'tea'
    price 20.0
  end

  factory :order do
    user
    first_course
    main_course
    drink_course
    created_at { Time.zone.now }
  end
end