class AddUserReferenceToSession < ActiveRecord::Migration[6.1]
  def change
    remove_column :sessions, :username
    add_reference :sessions, :user, null: false, foreign_key: true
  end
end
