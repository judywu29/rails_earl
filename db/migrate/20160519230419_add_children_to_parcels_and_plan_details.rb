class AddChildrenToParcelsAndPlanDetails < ActiveRecord::Migration
  def change
    add_column :parcels, :children_parcel_number, :text, array: true, default: []
    add_column :plan_details, :children_plan_number, :text, array: true, default: []
  end

end
