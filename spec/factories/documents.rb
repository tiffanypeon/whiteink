# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    text "MyText"
    note_id 1
    user_id 1
  end
end
