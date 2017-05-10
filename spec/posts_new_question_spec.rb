require 'rails_helper'

feature "sees form for new question" do

  scenario "user visits the new question page" do

    visit new_question_path

    expect(page).to have_content("Post Your Question")
  end

  scenario "user submits question successfully" do
    question = FactoryGirl.build(:question)

    visit new_question_path

    fill_in "question_title", with: question.title
    fill_in "question_description", with: question.description
    
    click_on 'Submit Your Question'

    expect(page).to have_content('Question was successfully created.')
  end
end
