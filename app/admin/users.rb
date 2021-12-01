ActiveAdmin.register User do
	
  index do
    selectable_column
	  
	id_column
	
	column :email
	column "장바구니 유무" do |user|
	  user.carts.present?
	end
	    
	actions do |user|
	  a "장바구니 확인", href: "/admin/users/#{user.id}/carts"
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone, :address, :post_code
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone, :address, :post_code]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
