module Refinery
  module Calendar
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Calendar

      engine_name :refinery_events

      initializer "register refinerycms_categories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.calendar_admin_categories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/calendar/category',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/calendar/categories(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Categories)
      end
    end
  end
end
