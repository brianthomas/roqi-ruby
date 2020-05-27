class CreateCapabilities < ActiveRecord::Migration
  def change
    create_table :capabilities do |t|
      t.string :xsi_type
      t.string :standard_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
