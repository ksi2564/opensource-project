class AddCancelReasonToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cancel_reason, :text
  end
end
