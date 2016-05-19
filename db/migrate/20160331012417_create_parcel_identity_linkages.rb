class CreateParcelIdentityLinkages < ActiveRecord::Migration
  def change
    create_table :parcel_identity_linkages do |t|
      t.integer :identity_plan_detail_id
      t.integer :parcel_id

      t.timestamps null: false
    end
    add_index :parcel_identity_linkages, :parcel_id

  end
end
