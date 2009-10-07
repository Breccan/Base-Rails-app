class AddUsersPasswordResetFields < ActiveRecord::Migration
  def self.up

    add_index :users, :perishable_token  
    add_index :users, :email  
  end

  def self.down
    remove_index :users, :column => :email
    remove_index :users, :column => :perishable_token

  end
end
