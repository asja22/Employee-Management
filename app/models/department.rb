class Department < ApplicationRecord
  has_many :position
  has_many :employee
end
