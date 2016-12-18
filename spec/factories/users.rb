FactoryGirl.define do

  # Фабрика для пользователя
  factory :user do
    association :role, factory: :role, strategy: :build
    user_name     'user'
    email         'user@example.com``'
    first_name    'user'
    last_name     'userovich'
    middle_name   'userov'
    password '123456'
    password_confirmation '123456'
  end
end