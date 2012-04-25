require 'date'

Role.create(:name => "Admin", :band => 6, :level => 5, :min_salary => 50000,
:max_salary => 90000, :paid_leaves => 30)

Role.create(:name => "Manager", :band => 4, :level => 2, :min_salary => 20000,
:max_salary => 60000, :paid_leaves => 25)

Role.create(:name => "exicutive", :band => 2, :level => 2, :min_salary => 20000,
:max_salary => 40000, :paid_leaves => 25)

User.create(:first_name => "arun", :last_name => "singh", :email => "arun@yopmail.com", :password => "test1234",
:password_confirmation => "test1234", :role_id => 1, :manager_id => 1, :joining_date => Date.today,
:leave_used => 20, :salary => 80000)

User.create(:first_name => "santosh", :last_name => "kumar", :email => "santosh@yopmail.com", :password => "test1234",
:password_confirmation => "test1234", :role_id => 2, :manager_id => 1, :joining_date => Date.today,
:leave_used => 20, :salary => 50000)

User.create(:first_name => "magesh", :last_name => "yadav", :email => "magesh@yopmail.com", :password => "test1234",
:password_confirmation => "test1234", :role_id => 1, :manager_id => 2, :joining_date => Date.today,
:leave_used => 20, :salary => 30000)