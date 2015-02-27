require 'rails_helper'

describe Answer do
  let!(:user)     {User.create(username: "test", email: "test@test.com", password: "12345678")}
  let!(:question) {Question.create(author: user)}
  let!(:answer)   {Answer.new}

  describe "validations" do
    it "is invalid without an author" do
      answer.question = question
      expect(answer.save).to eq(false)
    end

    it "is valid with an author" do
      answer.question = question
      answer.author = user
      expect(answer.save).to eq(true)
    end

    it "is invalid without a question" do
      answer.author = user
      expect(answer.save).to eq(false)
    end

    it "is valid with a question" do
      answer.author = user
      answer.question = question
      expect(answer.save).to eq(true)
    end
  end
end