class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.boolean :owner, default: false
      t.boolean :confirmed, default: false
      t.string :token
      t.timestamps

      t.references :user, index: true
      t.references :project, index: true
    end
  end
end
