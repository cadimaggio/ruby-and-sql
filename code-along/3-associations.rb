# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database





# 1. insert new rows in the contacts table with relationship to a company

apple = Company.find_by({ "name" => "Apple" })

contact1 = Contact.new
contact1["first_name"] = "Tim"
contact1["last_name"] = "Cook"
contact1["email"] = "tim@apple.com"
contact1["company_id"] = apple["id"]
contact1.save

contact2 = Contact.new
contact2["first_name"] = "Craig"
contact2["last_name"] = "Federighi"
contact2["email"] = "craig@apple.com"
contact2["company_id"] = apple["id"]
contact2.save

amazon = Company.find_by({ "name" => "Amazon" })

contact3 = Contact.new
contact3["first_name"] = "Jeff"
contact3["last_name"] = "Bezos"
contact3["email"] = "jeff@amazon.com"
contact3["company_id"] = amazon["id"]
contact3.save

# 2. How many contacts work at Apple?

# first query to find the row in companies for Apple
apple = Company.find_by({ "name" => "Apple" })

# next, query to find all rows in contacts with relationship to Apple
# "talk" to the contacts table using the Contact model:

apple_contacts = Contact.where({ "company_id" => apple["id"] })
# puts apple_contacts.inspect

puts "Contacts at Apple: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

for apple_people in apple_contacts
    first_name = apple_people["first_name"] #remember that the thing before the [] will be the item after the 'for'
    last_name = apple_people["last_name"]
    puts "#{first_name} #{last_name}"
end

