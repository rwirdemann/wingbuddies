class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :spot
      t.datetime :when

      t.timestamps
    end
  end
end
