class PagesController < ApplicationController
  def home
    @order = current_user.orders.find_or_create_by(status: "open")
    @users = User.all
    @admins = Admin.all
  end
end
