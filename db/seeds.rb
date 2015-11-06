User.destroy_all
Profile.destroy_all

User.create! [
  { username: "fiorina", password_digest: "fiorina123" },
  { username: "trump", password_digest: "trump123" },
  { username: "carson", password_digest: "carson123" },
  { username: "clinton", password_digest: "clinton123" }
]


Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male" },
  { first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]
