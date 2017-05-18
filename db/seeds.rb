# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com"
u.password = '123456'
u.password_confirmation = '123456'
u.is_admin = true
u.save

u = User.new
u.email = "user@test.com"
u.password = '123456'
u.password_confirmation = '123456'
u.is_admin = false
u.save

f_title = ["商品1","商品2","商品3","商品4","商品5","商品6"]
f_uantity = [10,20,30,10,20,20]
f_price = [50,50,100,100,200,200]

for i in 0..5 do
  Product.create!(
  title: f_title [i],
  description: "测试用的商品描述",
  quantity: f_uantity [i],
  price: f_price [i],
  image: nil
  )
end
