module ApplicationHelper
  def display_username
    if admin_signed_in?
      current_admin.username
    elsif user_signed_in?
      current_user.username
    end
  end
end
