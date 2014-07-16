class User < ActiveRecord::Base
  authenticates_with_sorcery!
  self.inheritance_column = :role
end
