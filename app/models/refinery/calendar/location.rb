module Refinery
  module Calendar
    class Location < Refinery::Core::BaseModel

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, uniqueness: {case_sensitive: false}

      has_many :events, :class_name => 'Refinery::Calendar::Event', dependent: :restrict

    end
  end
end
