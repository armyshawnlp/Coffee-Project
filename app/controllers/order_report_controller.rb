class OrderReportController < ApplicationController
  def index

    # if params[:order]
    #   @orders = Order.where('order_date = ?', "#{params[:order]}")
    # elsif params[:start_date]
    #   @orders = Order.where('date BETWEEN ? AND ?', "#{params[:start_date]}", "#{params[:end_date]}")
    # else
      @orders = Order.all
    # end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order.reload
  end

  # GET /orders/new
  def new
    @order = Order.new
    3.times do |n|
      @order.order_items.build
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :sub_total, :total_amount, :tax, :order_date, :start_date, :end_date,
                                  :id, :order_items_attributes => [:order_id, :product_id, :id])
  end
end
