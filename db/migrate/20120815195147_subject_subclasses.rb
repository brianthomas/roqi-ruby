class SubjectSubclasses < ActiveRecord::Migration
  def up
    add_column :subjects, :parent_id, :integer
  end

  def down
    remove_column :subjects, :parent_id
  end

end
