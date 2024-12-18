class ProductsController < ApplicationController
  before_action :authenticate_store_admin!, only: [ :new, :create, :edit, :update, :archive ]
  before_action :set_product, only: %i[show edit update]

  # GET /products or /products.json
  def index
    @store = Store.find(params[:store_id])
    @products = ProductDecorator.decorate_collection(@store.products)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @store = current_store_admin.store
    @new_product = @store.products.new
  end

  # GET /products/1/edit
  def edit
    @store = current_store_admin.store
    @product = @store.products.find(params[:id])
  end

  # POST /products or /products.json
  def create
    @store = current_store_admin.store
    @product = @store.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to store_product_url(@store, @product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to store_product_url(@store, @product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @product = Product.find(params[:product_id])
    store = @product.store
    respond_to do |format|
    if @product.update(archived: true)
      format.html { redirect_to store_url(store), notice: "Product has been archived" }
    else
      format.html { redirect_to store_product_url(store, @product), alert: "Something went wrong" }
    end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = current_store_admin.store.products.find (params[:id])
    @store = current_store_admin.store
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :out_of_stock, :archived)
  end
end
