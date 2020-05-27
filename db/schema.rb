# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120816180247) do

  create_table "capabilities", :force => true do |t|
    t.string   "xsi_type"
    t.string   "standard_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfaces", :force => true do |t|
    t.string   "query_type"
    t.string   "resource_type"
    t.string   "url"
    t.string   "role"
    t.string   "use"
    t.string   "xsi_type"
    t.integer  "capability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.text     "title"
    t.string   "identifier"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "subjects_topics", :id => false, :force => true do |t|
    t.integer "subject_id"
    t.integer "topic_id"
  end

  add_index "subjects_topics", ["subject_id", "topic_id"], :name => "index_subjects_topics_on_subject_id_and_topic_id", :unique => true

  create_table "topics", :force => true do |t|
    t.string "name"
  end

end
