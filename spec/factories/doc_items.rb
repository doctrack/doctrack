# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doc_item do
    doc_id 1
    chapter_name "MyString"
    content "MyText"
  end
end
