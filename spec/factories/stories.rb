# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    text "MyText"
    title "MyString"
    deleted_at "2014-07-08 18:58:04"
    user nil
  end
end
