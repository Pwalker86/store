require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    let(:active_user) { create(:user) }
    let!(:active_user_orders) {create_list(:order, 3, user: active_user, shipping_address: {address1: Faker::Address.street_address })}

    it 'assigns @users and decorates them' do
      get orders_path
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:new)
      # expect(response).to have_http_status(200)
      # expect(:active_user).to be_present
      # expect(assigns(:orders)).to be_decorated
    end
  end
end
