class AddContainerToStories < ActiveRecord::Migration
  def change
    add_column :stories, :container, :string
  end
end
