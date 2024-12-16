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

  def user_type
    if current_store_admin
      "store_admin"
    elsif current_user
      "user"
    end
  end
end
