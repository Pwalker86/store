class StoresController < ApplicationController
  before_action :authenticate_store_admin!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
  end

  def show
    @store = Store.find(params[:id])
    @products = ProductDecorator.decorate_collection(@store.products.where(archived: false))
  end

  def new
    @store = current_store_admin.store
  end

  def create
  end

  def edit
    @store = current_store_admin.store
  end

  def update
    store = current_store_admin.store
    if store.update(store_params)
      redirect_to store_path(store), notice: "Store has been updated!"
    else
      redirect_to edit_store_path store, alert: "Something went wrong"
    end
  end

  def destroy
  end

  private

  def store_params
    params.expect(store: [ :name, :email, :phone_number, :location, :mission_statement, :location ])
  end
end
