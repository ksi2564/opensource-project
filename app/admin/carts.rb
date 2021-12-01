ActiveAdmin.register Cart do
  belongs_to :user

  index do
    selectable_column
	  
    id_column
	
	column :pack
	column :quantity
    column "상품 금액" do |cart|
	  number_to_currency(cart.pack.price * cart.quantity)
	end
	    
    actions
end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :pack_id, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :pack_id, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
