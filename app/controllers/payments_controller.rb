class PaymentsController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    iamport = Iamport.payment(params[:imp_uid])
    response = iamport["response"]

    if response["status"] == "paid"
      order.update(
        address: response["buyer_addr"],
        name: response["buyer_name"],
        phone: response["buyer_tel"],
        post_code: response["buyer_postcode"]
      )

      Payment.create(
        order: order,
        response: response,
        imp_uid: response["imp_uid"],
        merchant_uid: response["merchant_uid"],
        amount: response["amount"]
      )

      order.processed!

      flash[:notice] = "성공적으로 결제되었습니다!"
    elsif response["status"] == "failed"
      error_msg = response["fail_reason"]

      order.failed!

      flash[:notice] = error_msg
    end

    redirect_to "/orders"
  end
end