ActiveAdmin.register Pack do
  index do 
    selectable_column
	  
	id_column
	  
	column :image do |pack|
	  	if pack.image.attached?
		  image_tag url_for(pack.image), class: "small_img"
		else
		  "이미지 없음"
		end
	end
	column :product_name
	column :company_name
	column :desc
	
	  
	actions
  end
  # new, edit 커스텀 부분
  form do |f|
	f.inputs do
	  f.input :image, as: :file
	  f.input :product_name
	  f.input :company_name
	  f.input :desc
	end
	f.actions
  end
	
	
  # show 수정하는 부분
  show do
	attributes_table do
	  row :id
	  row :image do |pack|
		if pack.image.attached?
		  image_tag url_for(pack.image), class: "small_img"
		else
		  "이미지 없음"
		end
	  end
	  row :product_name
	  row :company_name
	  row :desc
	end
  end
end
