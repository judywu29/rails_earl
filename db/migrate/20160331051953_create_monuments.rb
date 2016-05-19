class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :state
      t.string :monument_type
      t.string :condition
      t.integer :cadastra_search_id

      t.timestamps null: false
    end
    add_column :monuments, :geom, :geometry, srid: 4326
    add_index :monuments, :geom, using: :gist
  end
end
