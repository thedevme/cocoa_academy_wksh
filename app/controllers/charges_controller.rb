class ChargesController < ApplicationController

  def create
  # Amount in cents
  product = Product.find(params[:product_id])

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:amount],
    :description => params[:title],
    :currency    => 'usd'
  )

  purchase = Purchase.create(email: params[:stripeEmail], card: params[:stripeToken], amount: product.price_in_cents,
    description: charge.description, currency: charge.currency, customer_id: customer.id, product_id: product.id, uuid: SecureRandom.uuid)

  redirect_to purchase

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
