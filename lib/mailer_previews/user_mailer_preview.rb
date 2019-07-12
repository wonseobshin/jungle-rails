class UserMailerPreview < ActionMailer::Preview
    def order_receipt
      UserMailer.order_receipt(order: Order.first)
    end
end