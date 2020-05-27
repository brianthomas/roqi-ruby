class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces do |t|
      t.string :query_type
      t.string :resource_type
      t.string :url
      t.string :role
      t.string :use
      t.string :xsi_type
      t.integer :capability_id

      t.timestamps
    end
  end
end
