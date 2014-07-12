class User < ActiveRecord::Base
  self.inheritance_column = :role
end