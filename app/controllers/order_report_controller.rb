class OrderReportController < ApplicationController
  def index
    @orders = Order.all
  end
end
