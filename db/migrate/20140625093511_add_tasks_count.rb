class AddTasksCount < ActiveRecord::Migration
  def change
    add_column :stories, :tasks_count, :integer, default: 0

    Story.reset_column_information

    Story.all.each do |story|
      Story.update_counters story.id, tasks_count: story.tasks.length
    end
  end
end
