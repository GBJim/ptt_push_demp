require 'csv'    
filename = "data_preprocess/userList.csv"

CSV.foreach(filename, :headers => true) do |row|
  User.create!(row.to_hash)
end