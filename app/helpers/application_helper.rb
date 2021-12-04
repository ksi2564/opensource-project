module ApplicationHelper
	
	def object_to_currency(obj)
		number_to_currency(obj.pack.price * obj.quantity)
	end
end
