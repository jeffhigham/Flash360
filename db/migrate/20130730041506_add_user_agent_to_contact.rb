class AddUserAgentToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :user_agent, :string
  end
end
