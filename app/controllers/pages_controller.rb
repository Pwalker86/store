class PagesController < ApplicationController
  def home
    @stores = Store.all
    # below are just for current dev purposes
    @users = User.all
    @admins = Admin.all
  end
end
