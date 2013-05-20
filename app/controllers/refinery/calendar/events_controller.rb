module Refinery
  module Calendar
    class EventsController < ::ApplicationController

      before_filter :find_all_upcoming_and_published_events
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def show
        begin
          @event = Event.published.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          flash[:error] = "Event konnte nicht gefunden werden"
          redirect_to refinery.calendar_events_path
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def new
        @event = Event.new
      end

      def create
        @event = Event.new(params[:event])
        @event.published = false

        if @event.save
          flash[:notice] = "Event wurde erfolgreich angelegt"
          redirect_to refinery.calendar_events_path
        else
          render :action => 'new'
        end
      end

      protected

      def find_all_upcoming_and_published_events
        @events = Event.published.where("date >= ?", Time.now).order("date ASC")
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/events").first
      end

    end
  end
end
