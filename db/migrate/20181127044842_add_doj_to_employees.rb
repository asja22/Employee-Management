class AddDojToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :doj, :string
  end
end
