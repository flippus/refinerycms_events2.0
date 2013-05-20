module Refinery
  module Calendar
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/calendar/event',
                :title_attribute => 'name',
                :xhr_paging => true,
                :order => "date DESC",
                :sortable => false

        def show
          @event
        end

        private

        def find_event
          begin
            @event = Event.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            flash[:error] = "Event konnte nicht gefunden werden"
            redirect_to refinery.calendar_admin_events_path
          end
        end
      end
    end
  end
end
