class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :name
      t.string  :password
      t.integer :manager_id
      t.integer :role_id
      t.date    :joining_date
      t.date    :end_date
      t.integer :salary
      t.integer :leave_used

      t.timestamps
    end
  end
end
