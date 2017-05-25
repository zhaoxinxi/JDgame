class CartsController < ApplicationController
  def index
    @coupons=Coupons::Models::Coupon.all
  end
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end
  def update
   @cart=current_cart
   @cart.update(cart_params)
     redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end

  def cart_params
    params.require(:cart).permit(:code)
  end
end
