class CreateJoinTableUserTransfer < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :transfers do |t|
      t.index [:user_id, :transfer_id]
    end
  end
end
