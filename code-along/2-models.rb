# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# puts "There are #{Company.all.count} companies" 

#write:  rails runner code-along/2-models.rb

# 2. insert new rows in companies table

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "apple.com"
new_company.save

# puts new_company.inspect

# puts "There are #{Company.all.count} companies" #use rails runner

new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2["url"] = "amazon.com"
new_company2.save

new_company3 = Company.new
new_company3["name"] = "Twitter"
new_company3["city"] = "San Francisco"
new_company3["state"] = "CA"
new_company3["url"] = "twitter.com"
new_company3.save

all_companies = Company.all #defines the all_companies variable as all the data in the Company model
# puts all_companies.inspect


# 3. query companies table to find all row with California company

california_companies = Company.where({"state" => "CA", "city" => "Cupertino"})
# puts california_companies.inspect

# 4. query companies table to find single row for Apple

apple = Company.find_by({"name" => "Apple"}) #use find_by for just one row, use where for the possibilities of more rows
# puts apple.inspect

# 5. read a row's column value #TO UPDATE ANYTHING YOU MUST US THE FIND_BY COMMAND

puts apple["url"]


# 6. update a row's column value

apple = Company.find_by({"name" => "Apple"})
apple["city"] = "Cupertino"
apple.save
puts apple["city"]

# 7. delete a row

twitter = Company.find_by({ "name" => "Twitter" })
twitter.destroy

# can also do: Company.find_by({"name" => "Twitter"}).destroy

# If need to UPDATE all instances of an item:
# Company.update_all({"state" => "California"})