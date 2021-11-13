class AddColumnWindfinderToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :windfinder, :string
  end
end
