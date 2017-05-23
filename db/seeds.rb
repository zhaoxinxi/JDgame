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


c = Category.new
c.name = "客厅"
c.save

c = Category.new
c.name = "卧室"
c.save



f_title = ["客厅1","客厅2","客厅3","卧室1","卧室2","卧室3"]
f_uantity = [10,20,30,10,20,20]
f_price = [50,50,100,100,200,200]
f_category_id = [1,1,1,2,2,2]



for i in 0..5 do
  Product.create!(
  title: f_title [i],
  description: "测试用的商品描述",
  quantity: f_uantity [i],
  price: f_price [i],
  image: nil,
  category_id: f_category_id [i],
  )
end
