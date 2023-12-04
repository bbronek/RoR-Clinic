doctors = []

10.times do |i|
  doctors << Doctor.create(
    first_name: "Jan#{i + 1}",
    last_name: "Nowak#{i + 1}",
    specialization: "Specialization#{i + 1}"
  )
  print "."
end

puts ""
puts "Doctors seeded successfully!"