require 'rails_helper'

feature "sees the details for the selected question" do

  let!(:first_question) { FactoryGirl.create(:question) }
  let!(:second_question) { FactoryGirl.create(:question, title: "What's the deal with airline food, is it food or is it not, discuss", description: "questions on airplane food Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words",
    created_at: Time.utc(2017, 2, 15, 7, 29, 11), updated_at: Time.utc(2017, 2, 15, 7, 29, 11)) }

  scenario "visits the question's details page" do

    visit question_path(first_question)

    expect(page).to have_content(first_question.description)
  end
end
