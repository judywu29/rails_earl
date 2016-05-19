class CreateQldLotPlanSearches < ActiveRecord::Migration
  def change
    create_table :qld_lot_plan_searches do |t|

      t.timestamps null: false
    end
  end
end
