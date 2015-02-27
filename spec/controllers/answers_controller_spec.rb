require 'rails_helper'


describe AnswersController do
  let!(:user) {User.create!(username: "fakeusername", email: "fake@fake.com", password: "fakefake")}
  let!(:question) {Question.create!(title:'fake question', content: 'fake', author: user)}
  let!(:answer) {Answer.create!(content:'fake', author: user, question: question)}

  describe "GET #new" do
    it "assigns @question as the current question" do
      get :new, { id: question.to_param}
      expect(assigns(:question)).to eq(question)
    end

    it "assigns @answer as a new answer" do
      get :new
      expect(assigns(:answer).id).to_not be
      expect(assigns(:answer)).to be_kind_of(Answer)
    end
  end

  describe "POST #create" do
    context "when it is passed valid params" do
      it "creates a new answer" do
        post :create, {answer:{id: answer.to_param}}
        expect(assigns(:answer)).to_be
      end

      it "renders the new answer" do
        pending
      end

    end

    context "when invalid params are passed" do
      it "renders an error message" do
        pending
      end

    end

  end

end
