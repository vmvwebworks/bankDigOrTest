class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.belongs_to :transfer
      t.belongs_to :bank
      t.timestamps
    end
  end
end
