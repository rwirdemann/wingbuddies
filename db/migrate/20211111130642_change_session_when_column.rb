class ChangeSessionWhenColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :sessions, :when, :date
    rename_column :sessions, :when, :day
  end
end
