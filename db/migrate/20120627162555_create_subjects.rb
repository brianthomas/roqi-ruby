class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :label
      t.string :uri

      t.timestamps
    end
  end
end
