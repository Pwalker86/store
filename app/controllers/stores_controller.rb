class StoresController < ApplicationController
  def index
  end

  def show
    # debugger
    @store = Store.find(params[:id])
    @products = @store.products
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def store_params
  end
end
