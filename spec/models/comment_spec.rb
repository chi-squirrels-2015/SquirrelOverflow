require 'rails_helper'

describe Comment do
  let!(:user)     {User.create(username: "test", email: "test@test.com", password: "12345678")}
  let!(:question) {Question.create(author: user)}
  let!(:answer)   {Answer.create(author: user, question: question)}
  let!(:comment)  {Comment.new}

  describe "validations" do
    it "is invalid without an author" do
      comment.answer = answer
      expect(comment.save).to eq(false)
    end

    it "is valid with an author" do
      comment.answer = answer
      comment.author = user
      expect(comment.save).to eq(true)
    end

    it "is invalid without an answer" do
      comment.author = user
      expect(comment.save).to eq(false)
    end

    it "is valid with an answer" do
      comment.author = user
      comment.answer = answer
      expect(comment.save).to eq(true)
    end
  end
end