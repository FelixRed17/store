class OrdersController < ApplicationController
    before_action :set_product, only: [:new, :create]

    def new
        @order = Current.user.orders.build(product: @product)
    end

    def create
        @order = Current.user.orders.build(order_params)
        @order.product = @product
        @order.unit_price_cents = @product.price_cents

        if @order.save
            redirect_to product_path(@product),
                        notice: "Your order has been placed.",
                        status: :see_other
        else
            render :new, status: :unprocessable_content
        end
    end

    private

    def set_product
        @product = Product.find(params[:product_id])
    end

    def order_params
        params.expect(order: [:quantity])
    end
end