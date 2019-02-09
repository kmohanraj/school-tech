class Student < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :assign_marks, dependent: :destroy
end
