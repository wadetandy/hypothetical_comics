# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyText"
    deleted_at "2014-07-08 18:58:00"
    user nil
  end
end
