class ChangeColumnToLinkages < ActiveRecord::Migration
  def change
    rename_column :plan_linkages, :linkage_plan_detail_id, :linkage_plan_number
    change_column :plan_linkages, :linkage_plan_number, :string
    rename_column :parcel_linkages, :linkage_parcel_id, :linkage_parcel_number
    change_column :parcel_linkages, :linkage_parcel_number, :string

  end
end
