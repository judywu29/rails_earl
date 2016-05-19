class CreateCadastraSearches < ActiveRecord::Migration
  def change
    create_table :cadastra_searches do |t|

      t.timestamps null: false
    end
  end
end
