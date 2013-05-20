
FactoryGirl.define do
  factory :event, :class => Refinery::Calendar::Event do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

