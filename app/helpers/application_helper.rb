module ApplicationHelper
  def display_username
    if admin_signed_in?
      current_admin.email
    elsif user_signed_in?
      current_user.email
    else
      "Guest - Not logged in"
    end
  end
end
