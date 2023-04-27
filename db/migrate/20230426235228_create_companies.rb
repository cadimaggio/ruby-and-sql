class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string "name" # t.string tells it to make a column that will have string values
      t.string "city"
      t.string "state"
      t.string "url"

      t.timestamps #also will come with. :)
    end
  end
end
# note that it will automatically make an auto-increment ID
# CAN ONLY RUN THIS ONCE! It will not run again!
# Easiest way to restart the table is to delete the database and restart (if you don't have any data in the database yet)
# if you want to update the name etc of the table, google ruby rails rename column or something similar