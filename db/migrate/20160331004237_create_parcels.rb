class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :lot_plan_number , :null => false
      t.string :area
      t.string :format
      t.string :klass
      t.string :state
      t.string :description
      t.string :title
      t.integer :cadastra_search_id
      t.timestamps null: false
    end
    add_column :parcels, :geom, :geometry, srid: 4326
    add_index :parcels, :lot_plan_number
    add_index :parcels, :geom, using: :gist

  end
end
