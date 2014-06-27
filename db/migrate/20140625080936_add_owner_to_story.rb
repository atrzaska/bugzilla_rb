class AddOwnerToStory < ActiveRecord::Migration
  def change
    add_column :stories, :owner_id, :integer
  end
end
