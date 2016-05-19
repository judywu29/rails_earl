class CreateParcelLinkages < ActiveRecord::Migration
  def change
    create_table :parcel_linkages do |t|
      t.integer :linkage_parcel_id
      t.integer :parcel_id

      t.timestamps null: false
    end
    add_index :parcel_linkages, :parcel_id

  end
end
