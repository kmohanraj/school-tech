class Subject < ApplicationRecord
  belongs_to :user, optional: true
  has_many :students, dependent: :destroy
  has_many :assign_subjects, dependent: :destroy
  has_many :assign_marks, dependent: :destroy

end
