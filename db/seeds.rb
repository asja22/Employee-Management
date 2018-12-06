require 'csv'

puts "Importing departmet..."
CSV.foreach(Rails.root.join("departments.csv"), headers: true) do |row|
  Department.create! do |department|
    department.name = row[0]
  end
end

puts "Importing position..."
CSV.foreach(Rails.root.join("positions.csv"), headers: true) do |row|
  Position.create! do |position|
    position.name = row[0]
    position.department_id = row[1]
  end
end