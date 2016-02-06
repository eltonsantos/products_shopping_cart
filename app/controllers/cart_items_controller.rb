class CartItemsController < ApplicationController

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    @cart = current_cart
    @item = @cart.cart_items.find_by(product_id: params[:id])
    if @item.product.quantity >= item_params[:quantity].to_i
      @item.update(item_params)
      flash[:notice] = "Updated!"
    else
      flash[:warning] = "Could not update."
    end

    redirect_to carts_path
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart = current_cart
    @item = @cart.find_cart_item(params[:id])
    @product = @item.product
    @item.destroy
    flash[:warning] = "#{@product.name} removed with success!"
    redirect_to :back
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
    end
end
