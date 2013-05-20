module Refinery
  module Calendar
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/calendar/category',
                :title_attribute => 'name',
                :xhr_paging => true

        private

        def find_category
          begin
            @category = Category.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            flash[:error] = "Kategorie konnte nicht gefunden werden"
            redirect_to refinery.calendar_admin_categories_path
          end
        end

      end
    end
  end
end
