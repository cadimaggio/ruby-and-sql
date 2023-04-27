# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

apple = Company.find_by({ "name" => "Apple" })
ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
cook = Contact.find_by({"first_name" => "Tim"})

activity1 = Activity.new
activity1["notes"] = "quick check in over facetime"
activity1["salesperson_id"] = ben["id"]
activity1["contact_id"] = cook["id"]
activity1["occured_at"] = "met at Cupertino"
activity1.save

amazon = Company.find_by({ "name" => "Amazon" })
ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
bezos = Contact.find_by({"first_name" => "Jeff"})

activity2 = Activity.new
activity2["notes"] = "went for a jog"
activity2["salesperson_id"] = ben["id"]
activity2["contact_id"] = bezos["id"]
activity2["occured_at"] = "met at Starbucks"
activity2.save

apple = Company.find_by({ "name" => "Apple" })
ben = Salesperson.find_by({"first_name" => "Ben", "last_name" => "Block"})
craig = Contact.find_by({"first_name" => "Craig"})

activity3 = Activity.new
activity3["notes"] = "went to his daughter's terrible recital"
activity3["salesperson_id"] = ben["id"]
activity3["contact_id"] = craig["id"]
activity3["occured_at"] = "Palo Alto middle school"
activity3.save

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

activities = Activity.where({"salesperson_id" => ben["id"], "contact_id" => cook["id"]})
puts activities.inspect

for tim_activities in activities
    puts tim_activities["notes"]
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
