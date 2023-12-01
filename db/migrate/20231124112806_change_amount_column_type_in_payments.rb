class ChangeAmountColumnTypeInPayments < ActiveRecord::Migration[7.1]
  def change
    change_column :payments, :amount, 'numeric USING amount::numeric(10,2)'
  end
end
