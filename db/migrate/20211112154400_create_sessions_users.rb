class CreateSessionsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions_users do |t|
      t.belongs_to :session
      t.belongs_to :user
      t.timestamps
    end
  end
end
