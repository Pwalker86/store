namespace :orders do
  desc "Update existing orders to use polymorphic association"
  task update_orderable: :environment do
    Order.reset_column_information
    Order.find_each do | order |
      if order.user_id.present?
        order.update(orderable_type: "User", orderable_id: order.user_id)
      elsif order.guest_id.present?
        order.update(orderable_type: "Guest", orderable_id: order.guest_id)
      end
    end
  end
end
