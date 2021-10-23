class OrdersController < ApplicationController
  binding.pry
  def create
    @order = Order.new(order_params)
    @order.user_id = corrent_user.id
    @order.status = :pending

    if @order.save
      flash[:notice] = "Pedido criado com sucesso"
      RestaurantNotifierJob.perfeorm_later(current_user)
    else
      flash[:notice] = "Falha ao criar um pedido"
    end
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:product_id)
  end
end
