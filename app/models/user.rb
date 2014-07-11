class User < ActiveRecord::Base
  self.inheritance_column = :role

  validates :role, presence: true

  scope :project_owners, -> { where(role: 'ProjectOwner') }
  scope :backer, -> { where(role: 'Backer') }

end
