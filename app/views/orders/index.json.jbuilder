json.array!(@orders) do |order|
  json.id order.id
  json.title order.user.email
  json.description "#{order.first_course.name}, #{order.main_course.name}, #{order.drink_course.name}"
  if @admin
    json.url admin_order_url(order)
  else
    json.url daily_menus_url(order.first_course.daily_menu_id)
  end
  json.start order.created_at.beginning_of_day
  json.end order.created_at.end_of_day
end