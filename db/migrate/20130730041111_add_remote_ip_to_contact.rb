class AddRemoteIpToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :remote_ip, :string
  end
end
