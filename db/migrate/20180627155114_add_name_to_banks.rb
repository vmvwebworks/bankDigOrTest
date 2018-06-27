class AddNameToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :name, :string
  end
end
