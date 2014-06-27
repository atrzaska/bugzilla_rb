class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task

      t.timestamps
      t.references :story, index: true
    end
  end
end
