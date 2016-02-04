class CartsController < ApplicationController

  def checkout  
  end

  # Method for empty shopping cart
  def clean
    # Call method clean! on model
    current_cart.clean!
    flash[:warning] = "Shopping cart is empty!"
    redirect_to carts_path 
  end 

end