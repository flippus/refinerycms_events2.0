module Refinery
  module Calendar
    module Admin
      class LocationsController < ::Refinery::AdminController


        crudify :'refinery/calendar/location',
                :title_attribute => 'name',
                :xhr_paging => true

        private

        def find_location
          begin
            @location = Location.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            flash[:error] = "Location konnte nicht gefunden werden"
            redirect_to refinery.calendar_admin_locations_path
          end
        end
      end
    end
  end
end
