require 'csv'    
=begin


CSV.foreach(filename, :headers => true) do |row|
  User.create!(row.to_hash)
end




filename = "data_preprocess/pushList.csv"

CSV.foreach(filename, :headers => true) do |row|

  user = User.find_or_create_by(name: row[:user_name])
  user.pushes.create(body: row[:body])
  user.save
end

=end 

=begin
filename = "data_preprocess/sample_result.txt"
CSV.foreach(filename, :headers => true) do |row|
  user = User.find_by(name: row[:userA])
  user.similarities.create(score: row[:score], partner: row[:userB])
  user.save

end
=end