# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@users = User.create([ {email: 'buddy@foo.com', password: 'apples'},
                       {email: 'tommy@bar.com', password: 'apples'} ])

@projects = []
@users.each do |user|
  3.times do
    @projects << user.projects.create(title: Faker::Lorem.words, description: Faker::Lorem.sentences, public: false)
  end
  @projects << user.projects.create(title: Faker::Lorem.words, description: Faker::Lorem.sentences, public: true)
end                      

@todo_lists = []
@projects.each do |project|
  3.times { @todo_lists << project.todo_lists.create(title: Faker::Lorem.words(2)) }
end

@todo_lists.each do |todo_list|
  4.times { todo_list.todos.create(title: Faker::Lorem.sentence(2 + rand(6))) }
end