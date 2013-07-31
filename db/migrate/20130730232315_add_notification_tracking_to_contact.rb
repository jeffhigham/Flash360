class AddNotificationTrackingToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :viewed, :boolean, :default => false
    add_column :contacts, :notification_pushed, :boolean, :default => false
  end
end
