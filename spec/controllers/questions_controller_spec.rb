require 'rails_helper'

describe QuestionsController do
  let!(:user) {User.create!(email: "fake@fake.com", password: "fakefake")}
  # change user email to username when fixed in migrations
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

end
