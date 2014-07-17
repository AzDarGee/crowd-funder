class User < ActiveRecord::Base
  authenticates_with_sorcery!
  self.inheritance_column = :role

  CREATOR = 'ProjectOwner'
  BACKER = 'Backer'

  ROLES = [CREATOR, BACKER]

  def is?(requested_role)
    role == requested_role
  end
end
