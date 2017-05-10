require 'rails_helper'

feature "sees questions" do

  let!(:first_question) { FactoryGirl.create(:question) }
  let!(:second_question) { FactoryGirl.create(:question, title: "What's the deal with airline food, is it food or is it not, discuss", description: "questions on airplane food Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words",
    created_at: Time.utc(2017, 2, 15, 7, 29, 11), updated_at: Time.utc(2017, 2, 15, 7, 29, 11)) }

  scenario "see all the questions" do

    visit '/questions'

    expect(page).to have_content(first_question.title)
    expect(page).to have_content(second_question.title)
  end

  scenario "see questions listed in order by most recent post" do
    visit '/questions'

    expect(page).to have_content("#{second_question.title} #{first_question.title}")
  end
end
