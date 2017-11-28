# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# visitors
3000.times do
  Visitor.create!
end

Medium.create!(title: 'cpc')
Medium.create!(title: 'organic')
Medium.create!(title: 'affiliate')
Medium.create!(title: 'email')

100.times do
  title = Faker::Lorem.sentence + Faker::Address.city
  arpu = rand(10..30)
  Activity.create!(
    title: title,
    arpu: arpu
  )
end

# histories
visitors1 = Visitor.where(id: 1..1200)
visitors2 = Visitor.where(id: 1201..2100)
visitors3 = Visitor.where(id: 2101..2700)
visitors4 = Visitor.where(id: 2701..3000)

mediums = Medium.all
activities = Activity.all

# visit_activities
visitors1.each { |visitor| visitor.visit_activity(mediums.find(rand(1..4)), activities.find(rand(1..100))) }
visitors2.each do |visitor|
  for i in 0..1
    visitor.visit_activity(mediums.find(i+1), activities.find(rand(1..100)))
  end
end

visitors3.each do |visitor|
  for i in 0..2
    visitor.visit_activity(mediums.find(i+2), activities.find(rand(1..100)))
  end
end
visitors4.each do |visitor|
  for i in 0..3
    visitor.visit_activity(mediums.find(i+1), activities.find(rand(1..100)))
  end
end
