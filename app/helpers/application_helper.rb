module ApplicationHelper
  def display_username
    if store_admin_signed_in?
      current_store_admin.email
    elsif user_signed_in?
      current_user.email
    else
      "Guest - Not logged in"
    end
  end
end
