FactoryGirl.define do
  factory :question do
    title "Is the Earth Flat blah blah blah blah blah blah?"
    description "Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words Lorem Ipsum blah blah blah words words words words words"
    created_at Time.utc(2017, 1, 4, 14, 22, 0)
    updated_at Time.utc(2017, 1, 4, 14, 22, 0)
    user
  end
end
