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

ActiveRecord::Schema.define(:version => 20120628130909) do

  create_table "addresses", :force => true do |t|
    t.string  "address_type",              :default => "Work"
    t.string  "content"
    t.string  "city"
    t.string  "state",        :limit => 2
    t.string  "country",                   :default => "United States of America"
    t.integer "person_id"
    t.integer "zip_code",     :limit => 5
  end

  create_table "addresses_notes", :id => false, :force => true do |t|
    t.integer "note_id"
    t.integer "address_id"
  end

  create_table "awards", :force => true do |t|
    t.string  "name"
    t.string  "institution"
    t.integer "people_id"
    t.integer "calendar_dates_id"
  end

  create_table "awards_notes", :id => false, :force => true do |t|
    t.integer "awards_id"
    t.integer "notes_id"
  end

  create_table "awards_period", :force => true do |t|
    t.string   "time_type"
    t.integer  "calendar_dates_id"
    t.integer  "awards_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "calendar_dates", :force => true do |t|
    t.date    "start_date"
    t.date    "end_date"
    t.integer "year",        :limit => 4
    t.integer "month",       :limit => 2
    t.integer "day",         :limit => 2
    t.string  "semester"
    t.integer "fundings_id"
  end

  create_table "emails", :force => true do |t|
    t.string   "email_type", :default => "Work"
    t.string   "uri"
    t.integer  "person_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "emails_notes", :id => false, :force => true do |t|
    t.integer "note_id"
    t.integer "email_id"
  end

  create_table "emergency_contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "relation"
    t.integer  "person_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "emergency_contacts_notes", :id => false, :force => true do |t|
    t.integer "note_id"
    t.integer "emergency_contact_id"
  end

  create_table "fundings", :force => true do |t|
    t.string  "institution"
    t.text    "description"
    t.integer "person_id"
    t.integer "calendar_dates_id"
  end

  create_table "keywords", :force => true do |t|
    t.string   "keyword_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "keywords_research_periods", :id => false, :force => true do |t|
    t.integer "keywords_id"
    t.integer "research_periods_id"
  end

  create_table "leaves", :force => true do |t|
    t.integer "banked_courses_used"
    t.integer "people_id"
    t.integer "calendar_dates_id"
  end

  create_table "leaves_notes", :id => false, :force => true do |t|
    t.integer "leaves_id"
    t.integer "notes_id"
  end

  create_table "notes", :force => true do |t|
    t.string   "type"
    t.text     "content"
    t.integer  "timerecords_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "title",          :default => "Untitled"
  end

  create_table "notes_people", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "note_id"
  end

  create_table "notes_publications", :id => false, :force => true do |t|
    t.integer "publications_id"
    t.integer "notes_id"
  end

  create_table "notes_research_periods", :id => false, :force => true do |t|
    t.integer "notes_id"
    t.integer "research_periods_id"
  end

  create_table "notes_telephones", :id => false, :force => true do |t|
    t.integer "note_id"
    t.integer "telephone_id"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "gender"
    t.string   "race"
    t.string   "spouse_name"
    t.date     "date_of_birth"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "person_type",   :default => "Faculty"
    t.string   "img"
    t.integer  "directory_id"
    t.string   "nickname",      :default => "None"
  end

  create_table "publications", :force => true do |t|
    t.string  "title"
    t.string  "publisher"
    t.string  "role"
    t.integer "people_id"
    t.integer "calendar_dates_id"
  end

  create_table "research_periods", :force => true do |t|
    t.text    "description"
    t.string  "area_group"
    t.integer "people_id"
    t.integer "calendar_dates_id"
  end

  create_table "telephones", :force => true do |t|
    t.string   "telephone_type", :limit => 5, :default => "Work"
    t.integer  "number"
    t.integer  "person_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

end
