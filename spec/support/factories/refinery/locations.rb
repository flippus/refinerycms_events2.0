
FactoryGirl.define do
  factory :location, :class => Refinery::Calendar::Location do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

