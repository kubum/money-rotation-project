class AddFlowToRecords < ActiveRecord::Migration
  def change
    add_column :records, :flow, :string, :after => :user_id, :null => false
  end
end
