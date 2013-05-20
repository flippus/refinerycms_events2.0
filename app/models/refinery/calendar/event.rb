module Refinery
  module Calendar
    class Event < Refinery::Core::BaseModel

      attr_accessible :name, :room, :date, :location_id, :category_id, :host_name, :host_email, :contact_email, :comment, :admission, :link, :published, :position, :new_location, :location_selection
      attr_accessor :new_location, :location_selection

      acts_as_indexed :fields => [:name, :room, :host_name, :host_email, :contact_email, :comment, :link]

      validates :name, :date, :location, :category, :host_name, :host_email, :contact_email, :presence => true
      validates_numericality_of :admission, greater_than_or_equal_to:  0, allow_nil: true
      validates_format_of :host_email, :contact_email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, message: "must have email format"

      belongs_to :location, :class_name => '::Refinery::Calendar::Location'
      belongs_to :category, :class_name => '::Refinery::Calendar::Category'

      scope :published, where(published: true)

      before_validation :check_location_selection

      private

      def check_location_selection
        return if location_selection == "0"

        if !new_location.blank?
          created_location = Refinery::Calendar::Location.create!(name: new_location)
          self.location_id = created_location.id
        else
          errors.add(:new_location, "can't be blank")
        end
      end

    end
  end
end
