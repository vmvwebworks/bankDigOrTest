class RenameTypeToTransTypeInTransfers < ActiveRecord::Migration[5.2]
  def change
    rename_column :transfers, :type, :trans_type
  end
end
