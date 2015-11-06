User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

user_list = ["Fiorina", "Trump", "Carson", "Clinton"]

user_list.each do |user|
	User.create(username: "#{user}", password_digest: "#{user.downcase + "123"}")
end


# User.create! [
#   { username: "fiorina", password_digest: "fiorina123" },
#   { username: "trump", password_digest: "trump123" },
#   { username: "carson", password_digest: "carson123" },
#   { username: "clinton", password_digest: "clinton123" }
# ]


Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male" },
  { first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]

user_list.each do |user|
	us = User.find_by username: user
	pr = Profile.find_by last_name: user
	us.profile = pr
end




TodoList.create! [
  { list_name: "Fiorina", list_due_date: Date.today + 1.year },
  { list_name: "Trump", list_due_date: Date.today + 1.year },
  { list_name: "Carson", list_due_date: Date.today + 1.year },
  { list_name: "Clinton", list_due_date: Date.today + 1.year }
]

user_list.each do |user|
	us = User.find_by username: user
	tdl = TodoList.find_by list_name: user
	us.todo_lists << tdl
end



0.upto(19) do |i|
	TodoItem.create! title: "item#{i + 1}", due_date: Date.today + 1.year, description: "Description #{i + 1}", completed: false
end

k = 0
user_list.each do |user|
	tdl = TodoList.find_by list_name: user
    tdl.todo_items << TodoItem.limit(5).offset(k)
    k += 5
end

# TodoItem.create! [
#   { title: "item1", due_date: Date.today + 1.year, description: "Description 1", completed: false, todo_list_id: 1 },
#   { title: "item2", due_date: Date.today + 1.year, description: "Description 2", completed: false, todo_list_id: 1 },
#   { title: "item3", due_date: Date.today + 1.year, description: "Description 3", completed: false, todo_list_id: 1 },
#   { title: "item4", due_date: Date.today + 1.year, description: "Description 4", completed: false, todo_list_id: 1 },
#   { title: "item5", due_date: Date.today + 1.year, description: "Description 5", completed: false, todo_list_id: 1 },
#   { title: "item6", due_date: Date.today + 1.year, description: "Description 6", completed: false, todo_list_id: 2 },
#   { title: "item7", due_date: Date.today + 1.year, description: "Description 7", completed: false, todo_list_id: 2 },
#   { title: "item8", due_date: Date.today + 1.year, description: "Description 8", completed: false, todo_list_id: 2 },
#   { title: "item9", due_date: Date.today + 1.year, description: "Description 9", completed: false, todo_list_id: 2 },
#   { title: "item10", due_date: Date.today + 1.year, description: "Description 10", completed: false, todo_list_id: 2 },
#   { title: "item11", due_date: Date.today + 1.year, description: "Description 11", completed: false, todo_list_id: 3 },
#   { title: "item12", due_date: Date.today + 1.year, description: "Description 12", completed: false, todo_list_id: 3 },
#   { title: "item13", due_date: Date.today + 1.year, description: "Description 13", completed: false, todo_list_id: 3 },
#   { title: "item14", due_date: Date.today + 1.year, description: "Description 14", completed: false, todo_list_id: 3 },
#   { title: "item15", due_date: Date.today + 1.year, description: "Description 15", completed: false, todo_list_id: 3 },
#   { title: "item16", due_date: Date.today + 1.year, description: "Description 16", completed: false, todo_list_id: 4 },   
#   { title: "item17", due_date: Date.today + 1.year, description: "Description 17", completed: false, todo_list_id: 4 },
#   { title: "item18", due_date: Date.today + 1.year, description: "Description 18", completed: false, todo_list_id: 4 },
#   { title: "item19", due_date: Date.today + 1.year, description: "Description 19", completed: false, todo_list_id: 4 },
#   { title: "item19", due_date: Date.today + 1.year, description: "Description 19", completed: false, todo_list_id: 4 }     
# ]