class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :empid
      t.string :name
      t.string :email
      t.integer :department_id
      t.integer :position_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :employees, [:user_id, :created_at]
  end
end
