class AddColumnVisibilityToSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :visibility, :string
    Session.find_each do |session|
      session.visibility = 'public'
      session.save!
    end
  end
end
