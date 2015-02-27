users=[]
100.times do
  users << User.create!(username: Faker::Name.name, password: '12345678', email: Faker::Internet.email)
end

questions=[]
1000.times do
  questions << Question.create!(title: Faker::Company.catch_phrase, content: Faker::Company.bs, author: users.sample)
end

answers=[]
500.times do
  answers << Answer.create!(content: Faker::Hacker.say_something_smart, question: questions.sample, author: users.sample)
end

comments=[]
500.times do
  comments << Comment.create!(answer: answers.sample, author: users.sample, content: Faker::Hacker.say_something_smart)
end

tags=[]
20.times do
 tags << Tag.create!(name: Faker::Hacker.adjective)
end

4000.times do
  Vote.create!(voter: users.sample, votable: (answers + comments + questions).sample, upvote: rand(2))
end

3200.times do
  TaggedQuestion.create!(tag: tags.sample, question: questions.sample)
end


