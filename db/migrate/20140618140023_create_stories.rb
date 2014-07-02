class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :state
      t.string :description
      t.string :story_type

      t.timestamps
      t.references :project, index: true
    end
  end
end
