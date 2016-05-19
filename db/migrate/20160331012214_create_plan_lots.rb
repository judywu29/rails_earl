class CreatePlanLots < ActiveRecord::Migration
  def change
    create_table :plan_lots do |t|
      t.string :lot_number
      t.integer :plan_detail_id
      t.timestamps null: false
    end
    add_index :plan_lots, :plan_detail_id

  end
end
