class AddColumnToPlanDetails < ActiveRecord::Migration
  def change
    add_column :plan_details, :lots, :string
    add_column :plan_details, :linkage_plan_numbers, :string
    add_column :parcels, :linkage_parcel_numbers, :string
  end
end
