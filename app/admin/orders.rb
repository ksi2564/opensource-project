ActiveAdmin.register Order do
	scope :all
	scope -> {"결제 전"}, :before_payment
	scope -> {"결제 완료"}, :processed
	scope -> {"결제 실패"}, :failed
	scope -> {"결제 취소"}, :cancelled
	
	filter :name
	filter :phone
	filter :address
	filter :email
	
    batch_action :cancelled, form: { cancel_reason:  :textarea } do |ids, inputs|
  	  orders = Order.where(id: ids)
		
	  orders.each do |order|
		  body = {
  			imp_uid: order.payment.imp_uid,
  			merchant_uid: order.payment.merchant_uid,
  			amount: order.payment.amount
			}
		  Iamport.cancel(body)
		  
		  order.update(cancel_reason: inputs["cancel_reason"], status: :cancelled)
	  end
  	  	  redirect_to collection_path, notice: "성공적으로 결체취소 처리되었습니다."
	end
	
  index do
    selectable_column
    id_column
	column :user do |order|
		a order.user.email, href: "/admin/users/#{order.user.id}"
	end
	column :address
    column :email
    column :name
    column :phone
	column :status
	column :create_at
    actions
  end

  show do
	attributes_table do
	  row :address
	  row :email
	  row :name
	  row :phone
	  row :status
	end
	panel "주문 상품 정보" do
      table_for order.order_items do
	  	column "상품명" do |item|
		  item.pack.product_name
	  	end
      	column "수량" do |item|
		  item.quantity
	 	 end
	 	 column "가격" do |item|
		  number_to_currency(item.pack.price * item.quantity)
	  	end
	  	column "상세보기" do |item|
		  a "이동", href: "/admin/packs/#{item.pack.id}", target: "_blank"
	  	end
      end
    end
  end
	sidebar "결제 정보", only: :show do
    attributes_table_for order.payment do
		row :amount do |payment|
			number_to_currency(payment.amount)
		end
		row :imp_uid
		row :merchant_uid
		row "영수증 발급" do |payment|
			a "이동", href: payment.response["receipt_url"], target: "_blank"
		end
    end
  end
end