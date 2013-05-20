class CreateCalendarEvents < ActiveRecord::Migration

  def up
    create_table :refinery_calendar_events do |t|

      t.string :name

      t.string :room

      t.datetime :date

      t.string :host_name

      t.string :host_email

      t.string :contact_email

      t.text :comment

      t.decimal :admission

      t.string :link

      t.boolean :published

      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-calendar"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/calendar/events"})
    end

    drop_table :refinery_calendar_events

  end

end
