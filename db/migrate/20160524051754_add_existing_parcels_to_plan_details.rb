class AddExistingParcelsToPlanDetails < ActiveRecord::Migration
  def change
    add_column :plan_details, :existing_parcels, :text, array: true, default: []
  end
end
