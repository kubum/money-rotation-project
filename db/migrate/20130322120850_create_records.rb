class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :amount, :null => false, :default => 0
      t.string :comment

      t.timestamps
    end
  end
end
