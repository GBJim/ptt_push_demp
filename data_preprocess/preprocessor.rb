require 'csv'
require 'set'



usersSet = Set.new
users_to_id = {}
user_names = []
columns = [:name]
f = File.open("data_preprocess/sample_result.txt")
f.each_line do |line|
	row = line.strip.split(",")
	userA = row[0] 
	userB = row[1]
	usersSet.add(userA)
	usersSet.add(userB)
end

user_to_id = {}
pushes = []

usersSet.each do |user_name|
	user = User.find_by(name: user_name)
	user_to_id[user_name] = user.id unless user.nil?
end




similarities = []

CSV.foreach('data_preprocess/sample_result.txt', :headers => true) do |row|
	userA = row.to_hash['userA']
	userB = row.to_hash['userB']
	score = row.to_hash['score']
	user_id = user_to_id[userA]

	similarity = Similarity.new({user_id:user_id, score: score, partner: userB})
	similarities << similarity
	end
puts similarities.length

Similarity.import similarities



=begin
usersSet = Set.new
users_to_id = {}
user_names = []
columns = [:name]
f = File.open("data_preprocess/sample_result.txt")
f.each_line do |line|
	row = line.strip.split(",")
	userA = row[0] 
	userB = row[1]
	usersSet.add(userA)
	usersSet.add(userB)
end

user_to_id = {}
pushes = []

usersSet.each do |user_name|
	user = User.find_by(name: user_name)
	user_to_id[user_name] = user.id unless user.nil?
end


f = File.open("data_preprocess/pushes.txt")
f.each_line do |line|
	row = line.strip.split("\t")
	user = row[0]
	if user_to_id.has_key?(user)
		body = row[1]
		user_id = user_to_id[user]
		pushes << Push.new({user_id: user_id, body: body})
	end
	
	
end
Push.import pushes


=begin
CSV.open("data_preprocess/pushList.csv", "w") do |csv|
	csv << ["user_name", "body"]
	f = File.open("data_preprocess/pushes.txt")
	f.each_line do |line|
		row = line.strip.split("\t")


		user = users_to_id[row[0]]
		
		body = row[1]
		csv << [user, body]
	end
end
	


usersSet = Set.new

CSV.foreach('sample_result.txt', :headers => true) do |row|
	userA = row.to_hash['userA']
	userB = row.to_hash['userB']
	score = ['']
	usersSet.add(userA)
	usersSet.add(userB)
	end
puts usersSet.length

CSV.open("userList.csv", "w") do |csv|
	csv << ["user"]
	usersSet.each do |user|
		csv << [user]
	end
=end