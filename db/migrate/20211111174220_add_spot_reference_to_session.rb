class AddSpotReferenceToSession < ActiveRecord::Migration[6.1]
  def change
    remove_column :sessions, :spot
    add_reference :sessions, :spot, null: false, foreign_key: true
  end
end
