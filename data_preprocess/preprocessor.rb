require 'csv'
require 'set'

usersSet = Set.new

CSV.foreach('sample_result.txt', :headers => true) do |row|
	userA = row.to_hash['userA']
	userB = row.to_hash['userB']
	usersSet.add(userA)
	usersSet.add(userB)
	end
puts usersSet.length

CSV.open("userList.csv", "w") do |csv|
	csv << ["user"]
	usersSet.each do |user|
		csv << [user]
	end
end