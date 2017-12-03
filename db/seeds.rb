require 'csv'

puts "Importing skills..."
CSV.foreach(Rails.root.join("skills.csv"), headers: true) do |row|
  Skill.create! do |skill|
    skill.id = row[0]
    skill.name = row[1]
  end
end

puts "Importing newspapers..."
CSV.foreach(Rails.root.join("newspapers.csv"), headers: true) do |row|
  Newspaper.create! do |newspaper|
    newspaper.id = row[0]
    newspaper.name = row[1]
  end
end

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[1]
  end
end



puts "Importing states..."
CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.id = row[0]
    state.name = row[1]
    state.country_id = row[2]
  end
end

puts "Importing cities..."
CSV.foreach(Rails.root.join("cities.csv"), headers: true) do |row|
  City.create! do |city|
    city.id = row[0]
    city.state_id = row[1]
    city.country_id = row[2]
    city.name = row[3]
  end
end

puts "Importing tdegrees..."
CSV.foreach(Rails.root.join("tdegrees.csv"), headers: true) do |row|
  Tdegree.create! do |tdegree|
    tdegree.id = row[0]
    tdegree.name = row[1]
  end
end

puts "Importing degrees..."
CSV.foreach(Rails.root.join("degrees.csv"), headers: true) do |row|
  Degree.create! do |degree|
    degree.id = row[0]
    degree.tdegree_id = row[1]
    degree.name = row[2]
  end
end




puts "Importing professions..."
CSV.foreach(Rails.root.join("professions.csv"), headers: true) do |row|
  Profession.create! do |profession|
    profession.id = row[0]
    profession.name = row[1]
  end
end



puts "Importing organizations..."
CSV.foreach(Rails.root.join("organizations.csv"), headers: true) do |row|
  Organization.create! do |organization|
    organization.id = row[0]
    organization.name = row[1]
  end
end

puts "Importing institutes..."
CSV.foreach(Rails.root.join("institutes.csv"), headers: true) do |row|
  Institute.create! do |institute|
    institute.id = row[0]
    institute.city_id = row[1]
    institute.name = row[2]
  end
end
