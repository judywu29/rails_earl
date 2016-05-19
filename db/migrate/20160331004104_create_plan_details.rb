class CreatePlanDetails < ActiveRecord::Migration
  def change
    create_table :plan_details do |t|
      t.string :plan_number, :null => false
      t.string :description
      t.string :submission_date
      t.string :compiled
      t.string :field_note_flag
      t.string :surveyor
      t.integer :cadastra_search_id


      t.timestamps null: false
    end
    add_index :plan_details, :plan_number
  end
end
