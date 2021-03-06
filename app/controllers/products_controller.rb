class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    if params[:category].present?

      @category = Category.find_by(name: params[:category]) #找出是哪个category

      @products = Product.where(:category => @category) #找出这个category下的Job
    end
  end

  def show
   @product = Product.find(params[:id])
   @posts = @product.posts.all
  end
  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:notice] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
end
