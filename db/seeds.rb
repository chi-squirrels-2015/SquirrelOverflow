users=[]
100.times do
  users << User.create!(username: Faker::Name.name, password: '12345678', email: Faker::Internet.email)
  p User.last
end

questions=[]
1000.times do
  questions << Question.create!(title: Faker::Company.catch_phrase, content: Faker::Company.bs, author: users.sample)
  p Question.last
end

answers=[]
500.times do
  answers << Answer.create!(content: Faker::Hacker.say_something_smart, question: questions.sample, author: users.sample)
  p Answer.last
end

comments=[]
500.times do
  comments << Comment.create!(answer: answers.sample, author: users.sample, content: Faker::Hacker.say_something_smart)
  p Comment.last
end

tags=[]
until Tag.all.size == 20
 tags << Tag.create(name: Faker::Hacker.adjective)
 p Tag.last
end

4000.times do
  Vote.create!(voter: users.sample, votable: (answers + comments + questions).sample, upvote: rand(2))
  p Vote.last
end

3200.times do
  TaggedQuestion.create(tag: tags.sample, question: questions.sample)
  p TaggedQuestion.last
end


