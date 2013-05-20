class CreateCalendarCategories < ActiveRecord::Migration

  def up
    create_table :refinery_calendar_categories do |t|

      t.string :name

      t.integer :position

      t.timestamps
    end

    add_column :refinery_calendar_events, :category_id, :integer
    add_index :refinery_calendar_events, :category_id

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-calendar"})
    end

    drop_table :refinery_calendar_categories

    remove_column :refinery_calendar_events, :category_id
    remove_index :refinery_calendar_events, :category_id

  end

end
