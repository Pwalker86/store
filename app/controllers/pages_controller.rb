class PagesController < ApplicationController
  def home
    @store = Store.first
    @users = User.all
    @admins = Admin.all
  end
end
