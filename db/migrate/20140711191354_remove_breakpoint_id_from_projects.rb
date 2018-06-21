class RemoveBreakpointIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :breakpoint_id, :integer
  end
end
