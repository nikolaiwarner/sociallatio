
# Interaction Types
["Phone Call", "Hang Out", "Lunch", "Dinner", "IM/Text", "Meeting", "Email"].each do |type|
  InteractionType.find_or_create_by_name(type)
end


# Frequencies
Frequency.create!(:name => "Daily", :number_of_days => 1)
Frequency.create!(:name => "Weekly", :number_of_days => 7)
Frequency.create!(:name => "Monthly", :number_of_days => 30)
Frequency.create!(:name => "Yearly", :number_of_days => 365)