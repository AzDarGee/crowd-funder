class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.string :title
      t.string :description
      t.integer :amount
      t.integer :project_id

      t.timestamps
    end
  end
end
