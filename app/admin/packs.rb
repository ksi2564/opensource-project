ActiveAdmin.register Pack do
	
  scope :all, default: true
  scope -> {"공개"}, :published
  scope -> {"비공개"}, :unpublished
	
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
	column :price do |pack|
	  number_to_currency(pack.price)
	end
	column :is_publish
	
	  
	actions
  end
	
  batch_action :publish do |ids|
	@packs = Pack.where(id: ids)
	  
	@packs.each do |pack|
	  pack.update(is_publish: true)
	end
	
	flash[:notice] = "선택한 상품이 공개되었습니다."
	redirect_back(fallback_location: root_path)
	  
  end
	
  batch_action :unpublish do |ids|
	@packs = Pack.where(id: ids)
	  
	@packs.each do |pack|
	  pack.update(is_publish: false)
	end
	  
	flash[:error] = "선택한 상품이 비공개되었습니다."
	redirect_back(fallback_location: root_path)
	  
  end
	
  # new, edit 커스텀 부분
  form do |f|
	f.inputs do
	  f.input :image, as: :file
	  f.input :product_name
	  f.input :company_name
	  f.input :desc
	  f.input :price, hint: "실제 판매 가격을 입력하세요."
	  f.input :is_publish
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
