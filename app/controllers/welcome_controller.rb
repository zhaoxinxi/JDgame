class WelcomeController < ApplicationController

  def index
    @prducts = Product.where(id:[50,62,63,65])
  end
  
end
