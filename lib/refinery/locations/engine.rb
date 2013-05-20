module Refinery
  module Calendar
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Calendar

      engine_name :refinery_events

      initializer "register refinerycms_locations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "locations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.calendar_admin_locations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/calendar/location',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/calendar/locations(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Locations)
      end
    end
  end
end
