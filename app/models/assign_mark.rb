class AssignMark < ApplicationRecord
  belongs_to :subject, optional: true
  belongs_to :student, optional: true
  belongs_to :user, optional: true
end
