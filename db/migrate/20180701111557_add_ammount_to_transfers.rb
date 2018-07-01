class AddAmmountToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :money, :decimal
    add_column :transfers, :currency, :string
  end
end
