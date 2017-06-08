class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product_list_and_check_order_state
  def new

    if @product_list.post.present?
      redirect_to "/"
    end
    @post = Post.new
  end

  def create

    @post = Post.new(post_params)
    @post.product_list = @product_list
    @post.product_id = @product_list.product_id
      if @post.save
      redirect_to order_path(@product_list.order.token)
    else
      render :new
    end
  end

  def edit

    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
    @post.product_list = @product_list
      if @post.update(post_params)
      redirect_to order_path(@product_list.order.token)
    else
      render :edit
    end
  end


  private
  def find_product_list_and_check_order_state
    @product_list = ProductList.find(params[:product_list_id])
    if @product_list.order.aasm_state!="shipped"
      redirect_to order_path(@product_list.order.token)
      flash[:warning] = "确认收货后才能评价"
    end
  end

  def post_params
    params.require(:post).permit(:title,:description)
  end

end
