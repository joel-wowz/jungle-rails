class Admin::SalesController < ApplicationController

  def index 
    @sales = Sale.allP
  end

end
