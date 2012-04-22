class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :level
      t.integer :band
      t.integer :min_salary
      t.integer :max_salary
      t.integer :paid_leaves

      t.timestamps
    end
  end
end
