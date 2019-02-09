class AssignSubject < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :subject, optional: true
end
