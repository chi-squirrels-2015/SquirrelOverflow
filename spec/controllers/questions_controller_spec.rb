require 'rails_helper'

describe QuestionsController do
  let!(:user) {User.create!(username: "fakeusername", email: "fake@fake.com", password: "fakefake")}
  let!(:question) {Question.create!(title:'fake question', content: 'fake', author: user)}


  describe "GET #index" do

    it "assigns @questions to 10 questions" do
      20.times do
        Question.create!(title:'fake question', content: 'fake', author: user)
      end
      get :index
      expect(assigns(:questions)).to all(be_kind_of(Question))
      expect(assigns(:questions.count)).to eq(10)
    end

    it "assigns @questions to recent questions" do
      get :index
      expect(assigns(:questions)).to eq(Question.recent)
    end
  end

  describe "GET #show" do

    it "assigns @question to the current question" do
      get :show, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "assigns @answers to the answers of the current question" do
      get :show, { id: question.to_param }
      expect(assigns(:answers)).to eq(question.answers)
    end



  end

end
