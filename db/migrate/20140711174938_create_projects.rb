class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :funding_goal
      t.integer :funds_raised
      t.datetime :start_date
      t.datetime :end_date
      t.integer :breakpoint_id

      t.timestamps
    end
  end
end
