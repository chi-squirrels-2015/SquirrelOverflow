require 'rails_helper'

describe Question do
  let!(:user)     {User.create(username: "test", email: "test@test.com", password: "12345678")}
  let!(:question) {Question.new}

  describe "validations" do
    it "is invalid without an author" do
      expect(question.save).to eq(false)
    end

    it "is valid with an author" do
      question.author = user
      expect(question.save).to eq(true)
    end
  end

  describe "#recent" do
    before do
      20.times {Question.create!(author: user, title: Faker::Company.bs, content: Faker::Lorem.paragraph)}
    end

    it "returns AR relation of Questions" do
      expect(Question.recent[0]).to be_kind_of(Question)
    end

    it "displays the last 10 questions" do
      expect(Question.recent.size).to eq(10)
    end
  end
end