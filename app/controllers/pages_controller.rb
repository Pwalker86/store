class PagesController < ApplicationController
  def home
    @users = User.all
    @admins = Admin.all
  end
end
