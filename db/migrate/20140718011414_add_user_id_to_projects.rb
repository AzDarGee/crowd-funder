class AddUserIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_owner_id, :integer
    add_index :projects, :project_owner_id
  end
end
