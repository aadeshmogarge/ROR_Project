participant_array=["John Doe","20","male"]
participant_name=participant_array[0].split
participant_hash={first_name:participant_name[0], last_name:participant_name[1],age:participant_array[1],gender:participant_array[2]}
puts participant_hash
puts "Dear Mr/Ms #{participant_hash[:first_name]} #{participant_hash[:last_name]},\n
Thanks for your participation in this clinical trial. Below are your captured details,\n
First Name: #{participant_hash[:first_name]}
Last Name: #{participant_hash[:last_name]}
Age: #{participant_hash[:age]}
Gender: #{participant_hash[:gender]}"