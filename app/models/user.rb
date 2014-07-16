class User < ActiveRecord::Base
  authenticates_with_sorcery!
  self.inheritance_column = :role

  ADMIN = 'admin'
  CREATOR = 'creator'
  BACKER = 'backer'

  ROLES = [ADMIN, CREATOR, BACKER]

  def is?(requested_role)
    role == requested_role
  end
end
