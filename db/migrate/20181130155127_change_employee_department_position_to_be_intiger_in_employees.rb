class ChangeEmployeeDepartmentPositionToBeIntigerInEmployees < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :department, :integer
    change_column :employees, :position, :integer
  end
end
