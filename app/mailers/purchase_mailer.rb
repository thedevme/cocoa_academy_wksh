class PurchaseMailer < ActionMailer::Base
  layout 'purchase_mailer'
  default from: "Cocoa Academy Learn <learn@cocoa.academy>"

  def purchase_receipt purchase
    @purchase = purchase

    @product = Product.find(purchase.product_id)
    mail to: purchase.email, subject: "Thanks for your purchase!"
  end
end
