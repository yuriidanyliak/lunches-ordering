json.array!(@orders) do |order|
  json.id order.id
  json.clients_email order.user.email
  json.order "#{order.first_course.name}, #{order.main_course.name}, #{order.drink_course.name}"
  json.summary order.first_course.price + order.main_course.price + order.drink_course.price
end