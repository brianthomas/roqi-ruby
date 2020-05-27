class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
    end
    create_table :subjects_topics, :id => false do |t|
      t.integer :subject_id
      t.integer :topic_id
    end
    add_index :subjects_topics, [:subject_id, :topic_id], {:unique => true}
  end
end
