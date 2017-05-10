require 'rails_helper'

feature "user answers selected question" do

  let!(:first_question) { FactoryGirl.create(:question) }

  scenario "user clicks 'Answer this question' button" do

    visit question_path(first_question)

    click_on 'Answer this question'

    expect(page).to have_content("Answer #{first_question.title}")
  end

  scenario "user visits the new answer page" do

    visit new_question_answer_path

    expect(page).to have_content("Enter your answer")
  end

  scenario "user fills out answer and submits successfully" do
    answer = FactoryGirl.build(:answer)

    visit new_question_answer_path
    fill_in "answer_input", with answer.answer

  end
end
