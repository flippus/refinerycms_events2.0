
FactoryGirl.define do
  factory :category, :class => Refinery::Calendar::Category do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

