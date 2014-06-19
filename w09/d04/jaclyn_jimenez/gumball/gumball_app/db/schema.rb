# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20131121164208) do

  create_table "machines", :force => true do |t|
    t.integer  "candy"
    t.decimal  "money"
    t.string   "location"
    t.decimal  "owner_id"
    t.decimal  "candy_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "owners", :force => true do |t|
    t.decimal  "money"
    t.integer  "candy"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
