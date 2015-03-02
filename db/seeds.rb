users=[]
100.times do
  users << User.create!(username: Faker::Name.name, password: '12345678', email: Faker::Internet.email)
end

questions=[]
400.times do
  questions << Question.create!(title: Faker::Company.catch_phrase, content: Faker::Lorem.paragraph(20), author: users.sample)
end

answers=[]
5000.times do
  answers << Answer.create!(content: Faker::Hacker.say_something_smart, question: questions.sample, author: users.sample)
end

comments=[]
5000.times do
  comments << Comment.create!(answer: answers.sample, author: users.sample, content: Faker::Hacker.say_something_smart)
end

tags=[]
until Tag.all.size == 30
 tags << Tag.create(name: Faker::Hacker.adjective)
end

8000.times do
  Vote.create!(voter: users.sample, votable: (answers + comments + questions).sample, upvote: rand(2))
end

3000.times do
  TaggedQuestion.create(tag: tags.sample, question: questions.sample)
end


