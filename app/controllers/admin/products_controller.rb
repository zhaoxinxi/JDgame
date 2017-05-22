class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @products=Product.all
    if params[:category].present?                     # 这里是为了给首页加分类筛选条件
      @products = @products.where(category_id: params[:category])
    end
  end

  def new
    @product=Product.new
    @categories = Category.all.map{|c| [c.name,c.id]}  #加上这句，map的作用很关键，转换成数组，建立应射
  end

  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
    @product=Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
    @categories = Category.all.map{|c| [c.name,c.id]}   # 同样加上这句
  end

  def update
    @product=Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title,:description,:price,:quantity,:image,:category_id)
  end


end
