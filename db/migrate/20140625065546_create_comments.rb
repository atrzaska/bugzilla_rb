class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text

      t.timestamps
      t.references :story, index: true
    end
  end
end
