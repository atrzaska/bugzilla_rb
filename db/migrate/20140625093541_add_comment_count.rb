class AddCommentCount < ActiveRecord::Migration
  def change
    add_column :stories, :comments_count, :integer, default: 0

    Story.reset_column_information
    
    Story.all.each do |story|
      Story.update_counters story.id, comments_count: :story.comments.length
    end
  end
end
