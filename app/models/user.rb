class User < ApplicationRecord

  has_many :subjects, dependent: :destroy
  has_many :assign_subjects, dependent: :destroy
  has_many :assign_marks, dependent: :destroy

  	accepts_nested_attributes_for :assign_marks, 
                                allow_destroy: true, 
                                reject_if: proc { |att| att['mark'].blank? }

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :user
  end
    

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
