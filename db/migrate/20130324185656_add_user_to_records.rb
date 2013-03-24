class AddUserToRecords < ActiveRecord::Migration
  def change
    add_column :records, :user_id, :integer, :after => :id, :null => false
  end
end
