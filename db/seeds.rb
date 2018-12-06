require 'csv'

puts "Importing position..."
CSV.foreach(Rails.root.join("positions.csv"), headers: true) do |row|
  Position.create! do |position|
    position.name = row[0]
    position.department_id = row[1]
  end
end