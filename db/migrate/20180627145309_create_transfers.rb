class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.string :sender
      t.string :receiver
      t.string :type
      t.timestamps
    end
  end
end
