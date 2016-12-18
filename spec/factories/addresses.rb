FactoryGirl.define do

  # Фабрика для адреса
  factory :address do
    user_country "Country"
    user_region "Region"
    user_city "city"
    user_street "street"
    user_building "buildinG"
    user_apartment "apartment"
  end
end