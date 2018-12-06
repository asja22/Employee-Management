class ChangeEmployeeDepartmentPositionToBeStringInEmployees1 < ActiveRecord::Migration[5.2]
  def change
    change_column :employees, :department, :string
    change_column :employees, :position, :string
  end
end
