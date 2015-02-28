require 'rails_helper'

feature "Homepage" do
  before do
    user = User.create(username: "fake", email: "test@test.com", password: "fakefake", password_confirmation: "fakefake")
    11.times do |index|
      Question.create(title: "Fake Q#{index -1}", content: "some content for question #{index}", author: user)
    end
  end

  scenario "when user is on the main page sees a list of most recent questions" do
    visit questions_path

    10.times do |index|
      expect(page).to  have_content("Fake Q#{index}")
    end
  end

  scenario "when user is on the main page sees at most 10 questions" do
    visit questions_path

    expect(page).to have_css(".question-row", maximum: 10)
  end


  scenario "when user is on the main page sees Questions" do
    visit questions_path
    page.should have_content("Questions")
  end

end

feature "User visits a particular question" do
  let!(:user) {User.create(username: "fake", email: "test@test.com", password: "fakefake", password_confirmation: "fakefake")}
  let!(:question) {Question.create(title: "Fake Q", content: "some content", author: user)}
  let!(:answer) { Answer.create(content: "Fake answer content", author: user, question: question)}

  scenario "sees the questions title and content" do
    visit question_path(question)

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.content)
  end

  scenario "can see an answers" do
    visit question_path(question)
    expect(page).to have_content(answer.content)
  end

  scenario "can add an answer" do
    visit new_user_session_path
    fill_in "Login", with: user.email
    fill_in "Password", with: 'fakefake'
    click_button 'Log in'

    visit question_path(question)
    page.fill_in "answer_content", with: "Hello"
    click_button("Save Answer")
    expect(page).to have_content("Hello")

  end
end
