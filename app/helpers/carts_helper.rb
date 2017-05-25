module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
  end
  def render_cart_turetotal_price(cart)
    Coupons.apply(current_cart.code, amount: render_cart_total_price(current_cart)).to_a.third.second.to_i
  end
end
