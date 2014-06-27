class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.boolean :flag
      t.timestamps
      t.references :project, index: true
    end
  end
end
