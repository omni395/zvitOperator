# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


['registered', 'admin'].each do |role|
  Role.find_or_create_by({name: role})

[['Подключение', '97'], ['Кабель', '4'], ['Муфта', '10'], ['Клипса', '10'], ['Распечатка', '5']].each do |name, price|
  Material.find_or_create_by(material_name: name, material_price: price)
end
end