class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :title
      t.string :identifier
      t.integer :topic_id

      t.timestamps
    end
  end
end
