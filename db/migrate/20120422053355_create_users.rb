class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :first_name
      t.string  :last_name
      t.string  :password
      t.string  :confirm_password
      t.integer :manager_id
      t.integer :role_id
      t.date    :joining_date
      t.date    :end_date
      t.integer :salary
      t.integer :remaining_leaves

      t.timestamps
    end
  end
end
