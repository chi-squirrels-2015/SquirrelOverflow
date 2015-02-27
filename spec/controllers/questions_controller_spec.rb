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

  describe "GET #new" do
    it "creates a new question" do
      get :new
      expect(assigns(:question)).to be_a_kind_of(Question)
    end
  end

  describe "POST #create" do
    context "when valid parameters are passed" do
      it "creates a new question" do
        post :create, { question: {id: question.to_param} }
        expect(assigns(:question)).to_not be_nil
      end

      it "assigns a newly created question as @question" do
        post :create, { question: {id: question.to_param} }
        expect(assigns(:question)).to be_a_kind_of(Question)
      end

      it "redirects to the created question" do
        post :create, :id => question.id
        response.should redirect_to "/questions/#{question.id}"
      end
    end

    context "when invalid parameters are passed" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, { question: {id: question.to_param} }
        expect(assigns(:question)).to be_a_kind_of(Question)
      end

      it "re-renders the 'new' template" do
        post :create, { question: {id: question.to_param} }
        response.should redirect_to "/questions/new"
      end
    end
  end

  describe "GET #edit" do
    it "finds the correct question to edit" do
      get :edit, { question: {id: question.to_param} }
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "POST #update" do
    it "updates the correct question" do
      post :update

    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested question as @question" do
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the requested question" do
      expect {
        delete :destory, id: question.id
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      delete :destroy, { id: question.to_param }
      response.should redirect_to "/questions"
    end
  end

end
