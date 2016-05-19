class CreatePlanLinkages < ActiveRecord::Migration
  def change
    create_table :plan_linkages do |t|
      t.integer :linkage_plan_detail_id
      t.integer :plan_detail_id

      t.timestamps null: false
    end
    add_index :plan_linkages, :plan_detail_id

  end
end
