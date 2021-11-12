class AddUsernameToSession < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :username, :string    
  end
end
